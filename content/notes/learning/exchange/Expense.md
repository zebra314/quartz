---
title: Expense
enableToc: false
---
[[catalog/learning/exchange|exchange]]

```dataviewjs
// Get all the pages in the folder.
// Display the total expense for each type and payment method
// in each day and month.

const folderPath = `"notes/plans/expense"`;     
const pages = dv.pages(folderPath);

// Initialize variables
let resultToday = [];
let resultMonth = [];
let totalToday = 0;
let totalMonth = 0;
let totalMonth_food = 0;
let totalMonth_transport = 0;
let totalMonth_utilities = 0;
let totalMonth_entertainment = 0;
let totalMonth_other = 0;
let totalMonth_creditCard = 0;
let totalMonth_debitCard = 0;
let totalMonth_cash = 0;
let creditCard = 0;
let debitCard = 0;
let cash = 0;
let onlinePayment = 0;

const date = new Date();
const today = date.getDate();
const currentMonth = date.getMonth();

for (let page of pages) {
  const date_str = page.file.name;
  const date = new Date(page.file.name);
  const day = date.getDate();
  const month = date.getMonth();

  const content = await dv.io.load(page.file.path);
  const lines = content.split("\n");

  // Process each line to find lines starting with "RAW"
  for (let line of lines) {
    if (line.startsWith("RAW:")) {

      // Extract information from the RAW line
      const rawInfo = line.substring(5).split(", ");
      const [item, price, type, method] = rawInfo;

      if (day === today) {
        resultToday.push([item, price, type, method]);
        totalToday += parseInt(price);
      }

      if (month === currentMonth) {
        resultMonth.push([date_str, item, price, type, method]);

        // Calculate the total expense for each type
        switch (type) {
        case "Food":
          totalMonth_food += parseInt(price);
          break;
        case "Transport":
          totalMonth_transport += parseInt(price);
          break;
        case "Utilities":
          totalMonth_utilities += parseInt(price);
          break;
        case "Entertainment":
          totalMonth_entertainment += parseInt(price);
          break;
        case "Other":
          totalMonth_other += parseInt(price);
          break;
        }

        // Calculate the total expense for each payment method
        switch (method) {
        case "Credit Card":
          totalMonth_creditCard += parseInt(price);
          break;
        case "Debit Card":
          totalMonth_debitCard += parseInt(price);
          break;
        case "Cash":
          totalMonth_cash += parseInt(price);
          break;
        }
      }
    }
  }
}

totalMonth = totalMonth_food + totalMonth_transport + totalMonth_utilities + totalMonth_entertainment + totalMonth_other;

let resultType = [
  ["Food", totalMonth_food],
  ["Transport", totalMonth_transport],
  ["Utilities", totalMonth_utilities],
  ["Entertainment", totalMonth_entertainment],
  ["Other", totalMonth_other]
];

let resultMethod = [
  ["Credit Card", totalMonth_creditCard],
  ["Debit Card", totalMonth_debitCard],
  ["Cash", totalMonth_cash]
];

// Display
dv.paragraph("---");

dv.header(2, "Today's Expenses");
dv.table(["Item", "Price", "Type", "Method"], resultToday);

dv.paragraph("---");

dv.paragraph("Total Expense Today: " + totalToday);

dv.paragraph("---");

dv.header(2, "Month Expenses");

dv.table(["Date", "Item", "Price", "Type", "Method"], resultMonth);
dv.paragraph(" ");
dv.table(["Type", "Total"], resultType);
dv.paragraph(" ");
dv.table(["Method", "Total"], resultMethod);

dv.paragraph("---");

dv.paragraph("Total Expense This Month: " + totalMonth);

```