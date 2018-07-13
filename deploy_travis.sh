# Define custom utilities for deploying on travis

function deploy {
  printenv
  cd ${TRAVIS_BUILD_DIR}/wheelhouse
  mkdir test_wheels 
  for artifact in *.*; do
    echo $artifact
    mv $artifact test_wheels/$artifact;
  done
  svn co https://dist.apache.org/repos/dist/dev/beam/2.4.0
  cd 2.4.0
  mv ../test_wheels .
  svn add test_wheels
  echo $WHEELHOUSE_UPLOADER_USERNAME
  echo $WHEELHOUSE_UPLOADER_SECRET
  echo "print secret len"
  echo ${#WHEELHOUSE_UPLOADER_SECRET}
  echo ${#PASSWORD}
  svn commit --non-interactive --no-auth-cache --username $WHEELHOUSE_UPLOADER_USERNAME --password  -m "Upload python wheels"
}
