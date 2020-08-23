function api-push-dir
# copies an entire directory and its contents to the destination folder as given
           # by the user 
           scp -i ~/Citisketch/api-ssh/api.pem -r $argv[1] ubuntu@ec2-99-79-70-248.ca-central-1.compute.amazonaws.com:$argv[2]
end
