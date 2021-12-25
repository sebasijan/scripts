# get the daily image
# store it in firefox customisation folder
# store it in my wallpapers/bing folder
# see 
#   userContent.css in same firefox folder
#   crontab -e

import requests

class ImageData: 
    def __init__(self, data, title):
        self.data = data
        self.title = title

def get_firefox_destination_path():
    firefox_folder = '/home/bassie/.mozilla/firefox/'
    firefox_release_folder = firefox_folder + 'luneagrw' + '.default-release-1/'
    destination_folder = firefox_release_folder + 'chrome/img/'
    destination_file = 'home-background.jpg'
    destination_path = destination_folder + destination_file
    return destination_path

def get_image_data(): 
    image_info_url = 'https://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-UK'
    response = requests.get(image_info_url).json()
    image_info = response['images'][0]
    print(image_info)
    image_path = image_info['url']
    image_name = image_info['copyright'].split("(")[0] # trying to exclude copyright symbol
    image_url = 'https://bing.com' + image_path
    image_data = requests.get(image_url).content
    return ImageData(image_data, image_name)

def save_firefox_image(image_data):
    firefox_image_path = get_firefox_destination_path()
    with open(firefox_image_path, 'wb') as handler:
        handler.write(image_data)

def save_wallpaper_image(image_data, title):
    with open('/home/bassie/Pictures/wallpapers/bing/'+ title + '.jpg', 'wb') as handler:
        handler.write(image_data)

image_data = get_image_data()

save_firefox_image(image_data.data)
save_wallpaper_image(image_data.data, image_data.title)