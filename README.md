MyLittlePhoti
==============

This week's Makers project is a clone of Instagram (of course all test driven). The goal is to continue to enhance knowledge of Rails, and other advanced concepts such as:

- Uploading and processing images using Paperclip, hosting via Amazon S3
- Managing secret information (e.g. private keys)
- Many-to-many relationships in Rails (with tagging)
- Geocoding with Google Maps
- Twitter Bootstrap
- Creating APIs using Rails + jBuilder

Specifications:
---------------
- [x] Users can register/sign up (implemented with Devise)
- [x] Users must be signed in to create new posts
- [x] Posts can be created by providing a title and attaching an image
- [x] The image should be processed using Paperclip, to generate thumbnail-sized images
- [x] The homepage should list all the uploaded thumbnails - users can click through to see full-sized images
- [ ] Images are hosted on S3. Stub calls to S3 in test environment.

Versions:
---------
- [x] Image uploading
- [ ] Integrate bootstrap
- [ ] Tagging
- [ ] Geocoding and mapping
