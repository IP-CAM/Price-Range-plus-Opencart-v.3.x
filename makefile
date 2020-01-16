# Price Range+
#
# The «Price Range+» extension is for Opencart 3.x CMS.
# It allows to display range of a product prices based on manually entered min/max values or
# on price, discounts and options of this product.
#
# @package   Price Range+
# @version   1.0
#
# @author    Andrii Burkatskyi aka underr, <underr.ua@gmail.com>
# @copyright Copyright © 2020, Andrii Burkatskyi aka underr
# @license   https://raw.githubusercontent.com/underr-ua/ocmod3-price-range-plus/master/EULA.txt  EULA
#
# @link	  https://underr.space/notes/projects/project-020.html
# @link      https://github.com/underr-ua/ocmod3-price-range-plus
# @link      https://www.opencart.com/index.php?route=marketplace/extension/info&extension_id=38331

zip=$(shell basename `pwd`).ocmod.zip

license=EULA.txt
readme=README.md
datetime=201901010000.00
src=src
bin=bin


all: checkg clean makedir timestamp makezip hideg

checkg:
	@if [ ! -f "hideg.pwd" ]; then hideg; fi

makedir:
	mkdir -p "$(bin)"

timestamp:
	find . -exec touch -a -m -t $(datetime) {} \;

makezip:
	cd "$(src)" && zip -9qrX "../$(bin)/$(zip)" * && cd .. && zip -9qrX "$(bin)/$(zip)" "$(readme)" "$(license)"

unzip:
	unzip -o "$(bin)/$(zip)"

hideg: hideg.pwd
	hideg "$(bin)/$(zip)"

clean:
	@echo Cleaning...
	@rm -f "$(bin)"/*.*
	@rm -f "$(bin)"/*.zip
