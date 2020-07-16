# Collect BillPay Groups
This script reads an input file to extract the current day's BillPay groups. The groups are then placed into the specified OpCon Property.

# Disclaimer
No Support and No Warranty are provided by SMA Technologies for this project and related material. The use of this project's files is on your own risk.

SMA Technologies assumes no liability for damage caused by the usage of any of the files offered here via this Github repository.

# Prerequisites
This script needs to be run from the OpCon server and needs to be pointed to SAM's MSGIN folder.

# Instructions
There are 5 required command line parameters.
* FilePath - The path to the input file.
* PropertyName - The name of the OpCon Property which will store the BillPay groups (fully qualified Schedule or Job Instance Properties are recommended).
* MsginPath - The full path to SAM's MSGIN folder.
* MsginUser - The OpCon User Account which will be used to send the $PROPERTY:ADD event.
* MsginPass - The password fo the OpCon User Account which will be used to send the $PROPERTY:ADD event.

## Command Line Example
```
powershell.exe -ExecutionPolicy Bypass -File SMABillPay.ps1 -Filepath "C:\ProgramData\OpConxps\Billpay.txt" -PropertyName "SI.BillPay.[[$SCHEDULE DATE]].[[$SCHEDULE NAME]]" -MsginPath "C:\ProgramData\OpConxps\SAM\MSGIN" -MsginUser ocadm -MsginPass [[EventPass]]
```

# License
Copyright 2019 SMA Technologies

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

# Contributing
We love contributions, please read our [Contribution Guide](CONTRIBUTING.md) to get started!

# Code of Conduct
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-v2.0%20adopted-ff69b4.svg)](code-of-conduct.md)
SMA Technologies has adopted the [Contributor Covenant](CODE_OF_CONDUCT.md) as its Code of Conduct, and we expect project participants to adhere to it. Please read the [full text](CODE_OF_CONDUCT.md) so that you can understand what actions will and will not be tolerated.
