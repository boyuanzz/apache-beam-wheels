# Define custom utilities for deploying on travis

function deploy {
  cd ${TRAVIS_BUILD_DIR}/wheelhouse
  svn co https://dist.apache.org/repos/dist/dev/beam/2.4.0
  for artifact in *.whl; do
    echo $artifact
    mv $artifact 2.4.0/test_wheels/$artifact
  done
  cd 2.4.0/test_wheels
  svn add *
  svn commit --non-interactive --no-auth-cache --username $WHEELHOUSE_UPLOADER_USERNAME --password $WHEELHOUSE_UPLOADER_SECRET -m "Upload python wheels"
}
