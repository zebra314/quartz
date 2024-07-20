
<%*
const title = await tp.date.now("YYYY-MM-DD");

const folders = "notes/learning/exchange/Expense/";

const folder = await tp.system.suggester(folders, folders);

await tp.file.rename(`${title}`)

await tp.file.move(`/${folder}/${title}`)

%>


<% tp.date.now("YYYY-MM-DD") %>
- **Item**: <% tp.system.prompt("Item") %>
- **Price**: $<% tp.system.prompt("Price") %>
- **Type**: <% await tp.system.suggester(["Food & Drink", "Transport", "Utilities", "Entertainment", "Other"], ["Food & Drink", "Transport", "Utilities", "Entertainment", "Other"]) %>
- **Payment Method**: <% await tp.system.suggester(["Credit Card", "Debit Card", "Cash", "Online Payment"], ["Credit Card", "Debit Card", "Cash", "Online Payment"]) %>

<% (await tp.file.create_new('',  tp.date.now("YYYY-MM-DD HHmmss"))).basename %>