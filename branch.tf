   node
   {
    stage "1. install docker package"
    sh "yum install docker -y"
    stage "2. start docker service"
    sh "service docker start"
    stage "3. build the image"
    sh "docker build -t scripted-pipeline /home/ec2-user"
    stage "4. run the container"
    sh " docker run -dit -p 80:80 scripted-pipeline-container scripted-pipeline-image "
    stage "5. Tag the container"
    sh "docker tag scripted-pipeline-image vill2000/scripted-pipeline-image"
    stage "6. login to dockerhub"
    sh "docker login -u vill2000 -p Anniedaniel24"
    stage "7. push the image to dockerhub"
    sh "docker push vill2000/scripted-pipeline-image" 
}
