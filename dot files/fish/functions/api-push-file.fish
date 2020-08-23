function api-push-file
    #pushes a single file to the server
    scp -i ~/Citisketch/api-ssh/api.pem $argv[1] ubuntu@ec2-99-79-70-248.ca-central-1.compute.amazonaws.com:$argv[2]
end
