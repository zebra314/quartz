
## Total Expense

```dataviewjs
const folderPath = `"notes/plans/expense"`;     
const pages = dv.pages(folderPath);

const fileCount = pages.length;

let results = [];
let food, transport, utilities, entertainment, other = 0;
let creditCard, debitCard, cash, onlinePayment = 0;

for (let page of pages) {
  const date = page.file.name;
  const content = await dv.io.load(page.file.path);

  const lines = content.split("\n");

  // Process each line to find lines starting with "RAW"
  for (let line of lines) {
    if (line.startsWith("RAW:")) {

      // Extract information from the RAW line
      const rawInfo = line.substring(5).split(", ");
      const [item, price, type, method] = rawInfo;

      // Add the extracted information to the results array
      results.push([date, item, price, type, method]);

      // Calculate the total expense for each type
      switch (type) {
        case "Food":
          food += parseInt(price);
          break;
        case "Transport":
          transport += parseInt(price);
          break;
        case "Utilities":
          utilities += parseInt(price);
          break;
        case "Entertainment":
          entertainment += parseInt(price);
          break;
        case "Other":
          other += parseInt(price);
          break;
      }

      // Calculate the total expense for each payment method
      switch (method) {
        case "Credit Card":
          creditCard += parseInt(price);
          break;
        case "Debit Card":
          debitCard += parseInt(price);
          break;
        case "Cash":
          cash += parseInt(price);
          break;
        case "Online Payment":
          onlinePayment += parseInt(price);
          break;
      }
    }
  }
}

dv.table(["Date", "Item", "Price", "Type", "Method"], results);
```

## Details

```dataviewjs
const folderPath = `"notes/plans/expense"`;     
const pages = dv.pages(folderPath);

const fileCount = pages.length;

let results = [];

for (let page of pages) {
  const date = page.file.name;
  const content = await dv.io.load(page.file.path);

  const lines = content.split("\n");

  // Process each line to find lines starting with "RAW"
  for (let line of lines) {
    if (line.startsWith("RAW:")) {

      // Extract information from the RAW line
      const rawInfo = line.substring(5).split(", ");
      const [item, price, type, method] = rawInfo;

      // Add the extracted information to the results array
      results.push([date, item, price, type, method]);
    }
  }
}

dv.table(["Date", "Item", "Price", "Type", "Method"], results);
```
