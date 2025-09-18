CODE_CHANGES = getGitChanges()
pipeline {
  agent any 
  environment {
     NEW_VERSION = '1.3.0'
    SERVER_CREDENTIALS = credentials('')
  }
  stages {
      stage("build"){
          when {
            expression {
                 BRANCH_NAME == 'dev' && CODE_CHANGES == true 
            }
          }
          steps {
             echo 'building the application....'
            echo "with new version ${NEW_VERSION}"
          }
      }
    stage("test"){
          when {
            expression {
                 BRANCH_NAME == 'dev' || BRANCH_NAME == 'main'
            }
          }
          steps {
             echo 'testing the application....'
          }
      }
    stage("deploy"){
          steps {
             echo 'deploying the application....'
          }
      }
  }
}
