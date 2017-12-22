#===============================================================================
#   Author: Wenxuan
#    Email: wenxuangm@gmail.com
#  Created: 2017-12-22 12:26
#===============================================================================

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

mkdir -p ~/.proxychains
ln -sf $SCRIPT_DIR/proxychains.conf ~/.proxychains/proxychains.conf
