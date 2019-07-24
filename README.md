<h2>Eternal/MTG: Arena Draft Helper</h2>

<h3>In Progress...</h3>

<h3>Planned Features</h3>
<ul>
  <li>Upload of a screenshot from an open draft pack from the games Eternal or Magic Arena</li>
  <li>Text is extracted from the image using Google Vision API</li>
  <li>Extracted text is compared with card pool to pull the data for cards in your pack</li>
  <li>App will present you which cards are best/worst picks according to various community tier lists</li>
</ul>

<h3>Current Functionality:</h3>
<ul>
  <li>JavaScript image uploader implemented in React</li>
  <li>Image is sent by Rails back-end to Google Vision API</li>
  <li>Text is extracted from image and needs to be processed and matched to cards</li>
  <li>Card Database is seeded from Scryfall API</li>
  <li>In Progress: Pulling data from various players' tier lists. Currently two are seeded, using Google Spreadsheet API and Nokogiri Web Crawler</li>
</ul>
