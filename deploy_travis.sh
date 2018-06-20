# Define custom utilities for deploying on travis

function deploy {
  cd ${TRAVIS_BUILD_DIR}/wheelhouse
  mkdir python_wheels
  for artifact in *.*; do
    echo $artifact
    mv $artifact python_wheels/$artifact;
  done
  svn co https://dist.apache.org/repos/dist/dev/beam/$VERSION
  cd $VERSION
  mv ../python_wheels .
  svn add python_wheels
  echo $WHEELHOUSE_UPLOADER_USERNAME
  echo $WHEELHOUSE_UPLOADER_SECRET
  svn commit --username $WHEELHOUSE_UPLOADER_USERNAME --password $WHEELHOUSE_UPLOADER_SECRET -m "Upload python wheels"
}
