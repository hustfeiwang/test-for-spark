source ./conf.sh
source ./utils.sh

function run(){
echo $@
}
run `parse LocalALS  $PARAMETERS`
