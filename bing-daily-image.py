# get the daily image
# store it in firefox customisation folder
# see 
#   userContent.css in same folder
#   crontab -e

import requests

image_info_url = 'https://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-UK'
destination_file = 'home-background.jpg'
destination_folder = '/home/bassie/.mozilla/firefox/5g8grcoi.default-release/chrome/img/'
destination_path = destination_folder + destination_file 

response = requests.get(image_info_url).json()
image_info = response['images'][0]
image_path = image_info['url']
# image_title = image_info['title']

image_url = 'https://bing.com' + image_path
image_data = requests.get(image_url).content

with open(destination_path, 'wb') as handler:
    handler.write(image_data)