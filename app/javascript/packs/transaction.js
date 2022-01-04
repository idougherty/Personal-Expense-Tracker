let focusAmount = null;
let focusCategory = null;
let focusAccount = null;
let focusDate = null;
let focusEdit = null;
let focusId = null;

window.editAttributes = (idx, id) => {
    if(focusEdit != null) {
        let isReset = (focusEdit.innerHTML == "confirm");
        
        resetAttributes();

        if(isReset)
            return;
    }
    
    let list = document.getElementById("transactionList");
    let row = list.children[idx];

    let amount = row.children[0];
    let category = row.children[1];
    let account = row.children[2];
    let date = row.children[3];
    let edit = row.children[4].children[0];
    let sign = amount.classList[0] == "income" ? "" : "-";

    amount.innerHTML = `<input type="number" step=".01" name="amount" value=${sign + amount.innerHTML.substring(1)}>`;
    category.innerHTML = `<input list="categories" type="text" name="category" value=${category.innerHTML}>`;
    account.innerHTML = `<input list="accounts" type="text" name="account" value=${account.innerHTML}>`;
    date.innerHTML = `<input type="date" name="date" value=${date.innerHTML}>`;
    edit.innerHTML = `confirm`;

    focusAmount = amount;
    focusCategory = category;
    focusAccount = account;
    focusDate = date;
    focusEdit = edit;
    focusId = id;
}

function resetAttributes() {
    var xhttp = new XMLHttpRequest();
    xhttp.open("PATCH", `?transaction_id=${focusId}&amount=${focusAmount.firstChild.value}&category=${focusCategory.firstChild.value}&account_type=${focusAccount.firstChild.value}&category=${focusCategory.firstChild.value}&date=${focusDate.firstChild.value}`, true);
    xhttp.send();

    focusAmount.innerHTML = "$" + Math.abs(parseInt(focusAmount.firstChild.value)).toFixed(2);
    focusCategory.innerHTML = focusCategory.firstChild.value;
    focusAccount.innerHTML = focusAccount.firstChild.value;
    focusDate.innerHTML = focusDate.firstChild.value;
    focusEdit.innerHTML = "edit";

    focusEdit = null;
    focusId = null;
}