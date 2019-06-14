# Ruby Tasks

Purpose of this repository is to provide automated tests using
Ruby programming language and Rspec.

[![Build Status](https://travis-ci.com/AlekseyDidilov/RubyTasks.svg?branch=master)](https://travis-ci.com/AlekseyDidilov/RubyTasks)

## Project structure
The following directories tree outlines the most important information about project structure:
```text

├── README.md                 <= this file which documents the project.                  
└── practice                  <= a root directory
    │── lib                   <= a root directory for all modules
    │   ├── regex             <= modules for interactions with windows regex patterns 
    │   ├── registry          <= modules for interactions with windows registry 
    │   ├── services          <= modules for interactions with windows services
    │   └── windows           <= modules for interactions with windows commands                 
    │── ruby                  <= a root directory related to ruby core tasks
    │   └── selenium          <= a root directory for pages
    └── spec                  <= a root directory for all tests
        ├── regex             <= a root directory for all regex tests
        ├── registry          <= a root directory for all registry tests
        └── services          <= a root directory for all services tests
``` 
## Usage of automated tests
### Installation
Please use Ruby `2.6.3` for the test execution.

### Execution
If you need to run whole tests suite, please run 

```cmd
rspec spec
```  

If you need to run a particular test, please run
```cmd
rspec spec/folder/file_name_spec.rb
```
where `spec/folder/file_name_spec.rb` has to be replaced with desired test.

If you run WEB tests, please make sure you replace the `ruby/selenium/setting_example/credentials.yml`
with exist data.

                    