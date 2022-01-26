import json
import boto3

region = 'eu-west-1'


def lambda_handler(event, context):
    
    cb = boto3.client('codebuild')

    #print(f"the action was: {event['TF_ACTION']}")
    
    if (event["TF_ACTION"]== 'apply'):
        print("Creating a Nat gateway")
    elif (event["TF_ACTION"]== 'destroy'):
        print("Destroying a Nat gateway")
    
    response = cb.start_build(projectName='icdl-codebuild',
    
    environmentVariablesOverride=[
        {
            'name': 'TF_ACTION',
            'value': event["TF_ACTION"],
            'type': 'PLAINTEXT'
        },
    ] 
    )
    
    print( 'Successfully launched build.' )
    #print(response)
    
