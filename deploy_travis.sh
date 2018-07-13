# Define custom utilities for deploying on travis

function deploy {
  cd ${TRAVIS_BUILD_DIR}/wheelhouse
  svn co https://dist.apache.org/repos/dist/dev/beam/2.4.0/test_wheels
  for artifact in *.*; do
    echo $artifact
    cd test_wheels
    svn add $artifact
    cd ..
  done
  svn commit --non-interactive --no-auth-cache --username $WHEELHOUSE_UPLOADER_USERNAME --password $WHEELHOUSE_UPLOADER_SECRET -m "Upload python wheels"
}
