const express = require('express');

const {
    productGetHandler,
    productPostHandler,
    productPatchHandler,
    productDeleteHandler
} = require('../controller/product.controller');

const router = express.Router();

router.get('/',productGetHandler);

router.post('/',productPostHandler);

router.patch('/',productPatchHandler);


router.delete('/',productDeleteHandler);





module.exports = router;