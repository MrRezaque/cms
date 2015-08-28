class ImageUploadController < ApplicationController
  def upload
    params[:file]
    render json: {link: 'https://froala.s3.amazonaws.com/temp_files/J17RYYm8hlhB657OdsxpxQ.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256\u0026X-Amz-Credential=AKIAJUHKR4R4IEZSEUYQ%2F20150828%2Fus-east-1%2Fs3%2Faws4_request\u0026X-Amz-Date=20150828T063949Z\u0026X-Amz-Expires=10800\u0026X-Amz-SignedHeaders=host\u0026X-Amz-Signature=db738d814667efa493f917bf3ea983356d42c1f15ad569309dddc46f1de78ac4'}
  end
end
