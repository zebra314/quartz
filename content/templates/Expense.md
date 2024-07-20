<%*

const destinationFolder = "notes/learning/exchange/Expense";
const fileName = tp.date.now("YYYY-MM-DD") + ".md";
const filePath = destinationFolder + "/" + fileName;

let fileExists = await app.vault.adapter.exists(filePath);

const item = await tp.system.prompt("Item");
const price = await tp.system.prompt("Price");
const type = await tp.system.suggester(["Food & Drink", "Transport", "Utilities", "Entertainment", "Other"], ["Food & Drink", "Transport", "Utilities", "Entertainment", "Other"]);
const paymentMethod = await tp.system.suggester(["Credit Card", "Debit Card", "Cash", "Online Payment"], ["Credit Card", "Debit Card", "Cash", "Online Payment"]);

const content = `
- **Item**: ${item}
- **Price**: $${price}
- **Type**: ${type}
- **Payment Method**: ${paymentMethod}
`;

if (fileExists) {
  const existingContent = await app.vault.adapter.read(filePath);
  await app.vault.adapter.write(filePath, existingContent + "\n" + content);
} else {
  await app.vault.create(filePath, content);
}

%>
