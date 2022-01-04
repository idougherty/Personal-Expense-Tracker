let focusName = null;
let focusBalance = null;
let focusEdit = null;
let focusId = null;

window.editAttributes = (idx, id) => {
    if(focusName != null || focusBalance != null || focusEdit != null) {
        let isReset = (focusEdit.innerHTML == "confirm");
        
        resetAttributes();

        if(isReset)
            return;
    }
    
    let list = document.getElementById("accountList");
    let row = list.children[idx];

    let name = row.children[0];
    let balance = row.children[1];
    let edit = row.children[3].children[0];

    focusName = name;
    focusBalance = balance;
    focusEdit = edit;
    focusId = id;

    name.innerHTML = `<input list="accounts" type="text" name="name" value=${name.innerHTML}>`;
    balance.innerHTML = `<input type="number" step=".01" name="balance" value=${balance.innerHTML.substring(1)}>`;
    edit.innerHTML = `confirm`;
}

function resetAttributes() {
    var xhttp = new XMLHttpRequest();
    xhttp.open("PATCH", `?account_id=${focusId}&name=${focusName.firstChild.value}&balance=${focusBalance.firstChild.value}`, true);
    xhttp.send();

    focusName.innerHTML = focusName.firstChild.value;
    focusBalance.innerHTML = "$" + parseInt(focusBalance.firstChild.value).toFixed(2);
    focusEdit.innerHTML = "edit";

    focusName = null;
    focusBalance = null;
    focusEdit = null;
    focusId = null;
}