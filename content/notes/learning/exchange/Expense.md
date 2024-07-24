---
title: Expense
enableToc: false
---
[[catalog/learning/exchange|exchange]]

## 行前花費

- 機票：29428 NT
- 衣物：6948 NT
- 證件：
	- 簽證：4511 NT (1500 SEK)
	- 國際駕照：250 NT
	- ISIC學生證：480 NT
- 食物：1093 NT
- 保險：20934 NT
- 網路：300 NT (七天)
- 配件：
	- 讀卡機：255 NT
	- 鎖：210 NT
	- 保溫杯：980 NT
	- 快煮鍋：1380 NT
	- 保溫瓶：1024 NT
- 中華電信：(違約金＋月付)

## 各月花費

```dataviewjs
// Get all the pages in the folder.
// Display the total expense for each type and payment method
// in each day and month.

const folderPath = `"notes/plans/expense"`;     
const pages = dv.pages(folderPath);

// Define the period
const startDate = new Date("2024-08-01"); // Start of the period
const endDate = new Date("2025-07-03"); // End of the period

// Initialize variables
let resultMonths = new Map(); // key: year-month (string), value: total expense (map)

// Function to add months
function nextMonth(date) {
  let newDate = new Date(date);
  newDate.setMonth(newDate.getMonth() + 1);
  return newDate;
}

// Initialize the value for each month in the period
let currentDate = startDate;
while (currentDate <= endDate) {
  const yearMonth = `${currentDate.getFullYear()}-${String(currentDate.getMonth() + 1).padStart(2, '0')}`;
  
  let resultMonth = new Map([["Food", 0], ["Transport", 0], ["Utilities", 0], ["Entertainment", 0], ["Other", 0]]);

  resultMonths.set(yearMonth, resultMonth);
  currentDate = nextMonth(currentDate);
}

for (let page of pages) {
  const date = new Date(page.file.name);

  // Check if the page's date falls within the specified period
  if (date >= startDate && date <= endDate) {
    const monthKey = `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, '0')}`;
    let currentMonth = resultMonths.get(monthKey);

    const content = await dv.io.load(page.file.path);
    const lines = content.split("\n");

    for (let line of lines) {
      if (line.startsWith("RAW:")) {
        const rawInfo = line.substring(4).split(", ");
        const [item, price, type, method] = rawInfo;
        currentMonth.set(type, currentMonth.get(type) + parseInt(price));
      }
    }
  }
}

// Display
let tableData = [];
resultMonths.forEach((expenses, yearMonth) => {
  dv.header(2, yearMonth);

  let rowData = [];
  let totalMonth = 0;
  expenses.forEach((total, type) => {
    totalMonth += total;
    rowData.push([type, total]);
  });
  rowData.push(["Total", totalMonth]);
  dv.table(["Type", "Price"], rowData);
  dv.paragraph("---");
});

```
