FROM public.ecr.aws/lambda/python:3.11

RUN yum update -y \
    && pip3 install --upgrade pip setuptools

# Copy function code
COPY functions/replace-route/app.py ${LAMBDA_TASK_ROOT}

# Install the function's dependencies using file requirements.txt
# from your project folder.

COPY functions/replace-route/requirements.txt  .
RUN  pip3 install -r requirements.txt --target "${LAMBDA_TASK_ROOT}"

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "app.handler" ]
