# define helper functions
def imShow(path):
  import cv2
  import matplotlib.pyplot as plt

  image = cv2.imread(path)
  height, width = image.shape[:2]
  resized_image = cv2.resize(image,(3*width, 3*height), interpolation = cv2.INTER_CUBIC)

  fig = plt.gcf()
  fig.set_size_inches(18, 10)
  plt.axis("off")
  plt.imshow(cv2.cvtColor(resized_image, cv2.COLOR_BGR2RGB))
  plt.show()

# use this to upload files
def upload():
  from google.colab import files
  from IPython.display import clear_output
  uploaded = files.upload()
  imgs_list = []
  for name, data in uploaded.items():
    with open(name, 'wb') as f:
      f.write(data)
      print ('saved file', name)
      imgs_list.append(name)
  return imgs_list

the_model = None
def load_libs():
  import tensorflow as tf
  global the_model
  the_model = tf.keras.models.load_model('/content/darknet/classification_model/')
  pred_img('/content/PulEmb-Covid19/app-files/system_prepare.jpg')
  #return the_model

def prepare_img(img):
  import tensorflow as tf
  import matplotlib.pyplot as plt
  import numpy as np
  image = tf.keras.preprocessing.image.load_img(img)
  input_arr = tf.keras.preprocessing.image.img_to_array(image)
  input_arr /= 255
  input_arr = np.array([input_arr]) 
  return input_arr

def pred_img(img_):
  CLASSES_LIST = ('Yes','No')
  predictions = the_model.predict(prepare_img(img_))
  preds_ = None
  for the_class, pred in sorted(zip(CLASSES_LIST,predictions[0])):
    print('{}: {:.2%}'.format(the_class, pred))


