pipeline {
		agent any
			stages {
				stage("Compile") {
				steps {
					sh "./gradlew compileJava"
				}
			}
			stage("Unit test") {
				steps {
					sh "./gradlew test"
				}
			}
			stage("Package") {
				steps {
				sh "./gradlew build"
				}
			}
			stage("Docker build") {
				steps {
				sh "docker build -t 172.17.0.2:5000/calculator ."
				}
			}
			stage("Docker push") {
				steps {
				sh "docker push 172.17.0.2:5000/calculator"
				}
			}
			stage("Deploy to staging") {
				steps {
					sh "docker run -d --rm -p 8081:8081 --name calculator 172.17.0.2:5000/calculator"
				}
			}
			stage("Acceptance test") {
				steps {
					sleep 60
					sh "chmod +x acceptance_test.sh && ./acceptance_test.sh"
				}
			}
			}
			post {
				always {
					sh "docker stop calculator"
				}
			}
	}
