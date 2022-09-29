################################################################################
# shorten the Ansible encrypted vars command
################################################################################
function ans_enc_var() {
  ansible localhost -m debug -a "var=$1" -e="@$2"
}
