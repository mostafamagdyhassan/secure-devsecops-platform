def call() {
    stage('Security Scans') {
        parallel(
            'Semgrep': {
                sh '''
                    docker run --rm \
                      -v "$PWD:/src" \
                      semgrep/semgrep \
                      semgrep scan \
                      --config p/python \
                      --config /src/security/semgrep/rules.yml \
                      /src/app/backend \
                      --error
                '''
            },

            'Gitleaks': {
                sh '''
                    docker run --rm \
                      -v "$PWD:/repo" \
                      zricethezav/gitleaks:latest \
                      detect --source=/repo --no-git
                '''
            },

            'Checkov': {
                sh '''
                    docker run --rm \
                      -v "$PWD:/tf" \
                      bridgecrew/checkov \
                      --directory /tf/terraform
                '''
            }
        )
    }
}
