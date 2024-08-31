# PSBudget

## PowerShell Helpers for Budgeting with Excel

### Description

Do you often want to spin up a quick Excel spreadsheet to track your spending over a certain period?

Introducing **PSBudget**, a set of PowerShell helpers for creating, viewing, and editing budget spreadsheets in Excel.

### Quick Start

To create a budget for 28 days out with a starting amount of $300 and an initial spent amount of $29, Execute the following commands in PowerShell:

```
git clone https://github.com/wharvex/PSBudget.git
. ./PSBudget/NewBudget.ps1
New-Budget 300 28 29
```
