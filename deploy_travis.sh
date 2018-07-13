# Define custom utilities for deploying on travis

function deploy {
  svn co https://dist.apache.org/repos/dist/dev/beam/2.4.0
  cd 2.4.0/test_wheels
  echo "Build root dir"
  echo ${TRAVIS_BUILD_DIR}
  for artifact in ${TRAVIS_BUILD_DIR}/wheelhouse/*.*; do
    echo $artifact
    svn add $artifact
  done
  svn commit --non-interactive --no-auth-cache --username $WHEELHOUSE_UPLOADER_USERNAME --password $WHEELHOUSE_UPLOADER_SECRET -m "Upload python wheels"
}
