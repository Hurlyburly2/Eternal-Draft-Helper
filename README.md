<h2>Eternal/MTG: Arena Draft Helper</h2>

<h3>Current Live App:</h3>
http://fathomless-everglades-23302.herokuapp.com

<h3>In Progress...</h3>

<h3>Planned Features</h3>
<ul>
  <li>Upload of a screenshot from an open draft pack from the games Eternal or Magic Arena</li>
  <li>Text is extracted from the image using Google Vision API</li>
  <li>Extracted text is compared with card pool to pull the data for cards in your pack</li>
  <li>App will present you which cards are best/worst picks according to various community tier lists</li>
  <li>D3 graphing information for expansions and individual card packs</li>
</ul>

<h3>Current Functionality:</h3>
<ul>
  <li>JavaScript image uploader implemented in React</li>
  <li>Image is sent by Rails back-end to Google Vision API</li>
  <li>Text is extracted from image and needs to be processed and matched to cards</li>
  <li>Card Database is seeded from Scryfall API</li>
  <li>Data is pulled from players' tier lists via Google Spreadsheets, web crawlers, and from text files</li>
  <li>All API connections are authenticated and functional on Heroku. Currently you can upload an image and it will return the text displayed on the page. Here is a sample image to test it out with and see what the (unfiltered) result is: https://drive.google.com/file/d/1T37dzHmReelYeLKpwt06rtU3YIOOHanY/view</li>
</ul>
