# php-development

## Repository structure

*!Note:*
- *the images do not contain MySQL preinstalled, use an official image of MySQL / MariaDB 
or any other database, and link the container to the php's container*
- ***NodeJs** is not preinstalled, but it's stable repository is added to sources.list in the 
base image (`ubuntu/base` image)*

```
    /ubuntu                     // Base OS, all images under it are ubuntu based
    
    /ubuntu/base                // The modified OS image, there were added Ondrej's ppa 
                                // and NodeJs's LTS repo (6.x)
                                
    /ubuntu/apache-php7.0       // Contains the Apache 2.4 and PHP 7.0 
    
    /ubuntu/nginx-php7.0-fpm    // Containes Nginx 1.10 and PHP 7.0 with fpm module
    
```  


## Setup




## Further customization 