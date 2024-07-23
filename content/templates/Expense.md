<%*

const destinationFolder = "notes/plans/expense";
const fileName = tp.date.now("YYYY-MM-DD") + ".md";
const filePath = destinationFolder + "/" + fileName;

let fileExists = await app.vault.adapter.exists(filePath);

const item = await tp.system.prompt("Item");
const price = await tp.system.prompt("Price");
const type = await tp.system.suggester(["Food", "Transport", "Utilities", "Entertainment", "Other"], ["Food", "Transport", "Utilities", "Entertainment", "Other"]);
const paymentMethod = await tp.system.suggester(["Credit Card", "Debit Card", "Cash"], ["Credit Card", "Debit Card", "Cash"]);  

const content = `
Item: ${item}
Price: ${price}
Type: ${type}
Method: ${paymentMethod}
RAW: ${item}, ${price}, ${type}, ${paymentMethod}
`;

if (fileExists) {
  const existingContent = await app.vault.adapter.read(filePath);
  await app.vault.adapter.write(filePath, existingContent + "\n" + content);
} else {
  await app.vault.create(filePath, content);
}

%>
