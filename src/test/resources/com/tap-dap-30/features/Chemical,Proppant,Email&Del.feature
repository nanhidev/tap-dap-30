
Feature: Chemical,Proppant,Email&Del
  @feature_user_login
  Background: 
    Given the user is on the Jobs section

  @navigate_job_well_stage
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    When the user selects a Job from the list
    And the user chooses a Well associated with the Job
    And the user selects a Stage for the Job
    And the user clicks on the Chemical Setup option
    And the user clicks on the Proppant Setup option
    And the user clicks on the Email Setup option
    Then the Chemical Setup screen is displayed
    And the Proppant Setup screen is displayed
    And the Email Setup screen is displayed

    Examples:
      | Job   | Well   | Stage   |
      | Job1  | Well1  | Stage1  |

  @feature_user_login
  @add_acid_chemical
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    When the user clicks on the "Add Chemical" button
    And the user selects "Acid" from the chemical name dropdown
    And the user enters "<design_concentration>"
    And the user enters "<designed_volume>"
    And the user clicks on the "Save" button
    And the user refreshes the Chemical Setup screen
    Then the added Acid should appear in the list

    Examples:
      | design_concentration | designed_volume |
      | 50%                  | 100 liters      |

  @feature_user_login
  @add_slickwater
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    Given the user clicks on the "Add Chemical" button
    When the user selects "<chemical_name>" from the chemical name dropdown
    And the user enters "<design_concentration>"
    And the user enters "<designed_volume>"
    And the user clicks on the "Save" button
    And the user refreshes the Chemical Setup screen
    Then the added Slickwater should appear in the list

    Examples:
      | chemical_name | design_concentration | designed_volume  |
      | Slickwater    | 5%                   | 1000 liters      |

  @feature_user_login
  @add_diverters
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    Given the user clicks on the "Add Chemical" button
    When the user selects "Diverters" from the chemical name dropdown
    And the user enters <design_concentration>
    And the user enters <designed_volume>
    And the user clicks on the "Save" button
    And the user refreshes the Chemical Setup screen
    Then the added Diverters should appear in the list

    Examples:
      | design_concentration | designed_volume |
      | 50%                  | 1000 liters     |

  @feature_user_login
  @add_linear_gel
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    Given the user is on the Chemical Setup screen
    When the user clicks on the "Add Chemical" button
    And the user selects "Linear Gel" from the chemical name dropdown
    And the user enters "<design_concentration>"
    And the user enters "<designed_volume>"
    And the user clicks on the "Save" button
    And the user refreshes the Chemical Setup screen
    Then the added Linear Gel should appear in the list

    Examples:
      | design_concentration | designed_volume |
      | 5%                   | 100 liters      |

  @feature_user_login
  @add_proppants
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    When the user clicks on the "Add Proppant" button
    And the user selects <Proppant name> from the dropdown
    And the user enters <total design volume> as the total design volume
    And the user clicks on the "Save" button
    Then the user can add up to four Proppants successfully

    Examples:
      | Proppant name | total design volume |
      | Proppant1     | 1000                |
      | Proppant2     | 1000                |
      | Proppant3     | 1000                |
      | Proppant4     | 1000                |

  @verify_proppants
  Scenario Outline: Verify All Added Proppants Appear in the List
    When the user refreshes the Proppant Setup screen
    Then all added Proppants should appear in the list

    Examples:
      | Proppant name |
      | Proppant1     |
      | Proppant2     |
      | Proppant3     |
      | Proppant4     |

  @feature_user_login
  @add_chemical_vendor
  Scenario Outline: Add Chemical Vendor with PO Number
    Given the user is on the Email Setup screen
    When the user clicks on the "Add Vendor" button
    And the user selects "Chemical Vendor" from the vendor type dropdown
    And the user enters a valid PO number "<po_number>"
    And the user clicks on the "Save" button
    And the user refreshes the Email Setup screen
    Then the added Chemical vendor should appear in the list
    And the PO number should be displayed correctly

    Examples:
      | po_number  |
      | PO123456  |

  @feature_user_login
  @add_proppant_vendor
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    Given the user is on the Email Setup screen
    When the user clicks on the "Add Vendor" button
    And the user selects "Proppant Vendor" from the vendor type dropdown
    And the user enters a valid PO number "<po_number>"
    And the user clicks on the "Save" button
    And the user refreshes the Email Setup screen
    Then the added Proppant vendor should appear in the list
    And the PO number should be displayed correctly next to the vendor

    Examples:
      | po_number    |
      | 1234567890   |

  @feature_user_login
  @update_meeting_id
  Scenario Outline: Update Meeting ID in Others Section
    Given the user locates the "Others" section
    When the user clicks on the Meeting ID field
    And the user enters "<meeting_id>"
    And the user clicks on the "Save" button
    And the user refreshes the Email Setup screen
    Then the updated Meeting ID should be displayed correctly
    And no errors should occur during the update

    Examples:
      | meeting_id |
      | 123456     |

  @feature_user_login
  @configure_email_recipients
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    Given the user locates the Email Address section
    When the user clicks on the "<email_field>"
    And the user enters "<email_address>"
    Then the user clicks on the "Save" button
    And the user refreshes the Email Setup screen
    Then all entered email addresses are displayed correctly

    Examples:
      | email_field                 | email_address         |
      | first Email Address field   | <email_address_1>     |
      | second Email Address field  | <email_address_2>     |
      | third Email Address field   | <email_address_3>     |

  @test_data
  Examples:
    | email_address_1            | email_address_2        | email_address_3      |
    | krishna@gmail.com          | example@example.com    | test@test.com        |

  @feature_user_login
  @create_delivery_record
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    Given the user clicks on the "Create Delivery Record" button
    When the user selects a vendor from the vendor dropdown
    And the user enters a valid PO number "<po_number>"
    And the user selects a chemical type from the dropdown
    And the user enters a valid BOL number "<bol_number>"
    And the user enters a valid received quantity "<received_quantity>" and UOM "<uom>"
    And the user clicks on the "Save" button
    Then the delivery record is saved successfully

    Examples:
      | po_number   | bol_number  | received_quantity | uom |
      | PO123456    | BOL987654   | 100               | kg  |

  @feature_user_login
  @validate_dropdowns
  Scenario Outline: Validate Chemical, Proppant, and Email Setup Dropdowns
    When I click on the chemical name dropdown
    Then all chemical options are displayed correctly
    When I navigate to the Proppant Setup screen
    And I click on the Proppant name dropdown
    Then all Proppant options are displayed correctly
    When I navigate to the Email Setup screen
    And I click on the vendor type dropdown
    Then the vendor type dropdown is clickable

    Examples:
      | chemical_name | proppant_name | vendor_type |
      | Chemical A    | Proppant X    | Vendor 1    |

  @feature_user_login
  @chemical_setup
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    When the user clicks on the "Add Chemical" button
    And the user enters "<company_name>", "<name>", "<email>", "<proposal_id>", "<opportunity_name>", "<sales_engineer_name>", "<phone_number>", "<date>", "<time_period>", "<status>"
    And the user clicks on the "Save" button
    Then the chemical is saved successfully
    When the user clicks on the "Save & New" button
    And the user enters "<company_name>", "<name>", "<email>", "<proposal_id>", "<opportunity_name>", "<sales_engineer_name>", "<phone_number>", "<date>", "<time_period>", "<status>"
    And the user clicks on the "Save" button
    Then the new chemical is saved successfully
    When the user navigates to the Proppant Setup screen
    Then the Proppant Setup screen is displayed
    When the user clicks on the "Add Proppant" button
    And the user enters "<company_name>", "<name>", "<email>", "<proposal_id>", "<opportunity_name>", "<sales_engineer_name>", "<phone_number>", "<date>", "<time_period>", "<status>"
    And the user clicks on the "Save" button
    Then the Proppant is saved successfully

    Examples:
      | company_name    | name     | email               | proposal_id | opportunity_name | sales_engineer_name | phone_number | date       | time_period   | status      |
      | abcd pvt.ltd    | krishna  | krishna@gmail.com   | 231235      | ramu             | ramu                | 9876543210   | 12/5/2025  | 1 month ago   | contacted   |

  @feature_user_login
  @validate_workflow
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    When I navigate to the Chemical Setup screen
    And I add a chemical with "<chemical name>" and "<chemical type>"
    Then the Chemical Setup screen is displayed
    And the chemical is added successfully
    When I navigate to the Proppant Setup screen
    And I add a Proppant with "<proppant name>" and "<proppant type>"
    Then the Proppant Setup screen is displayed
    And the Proppant is added successfully
    When I navigate to the Email Setup screen
    And I add a vendor with "<vendor name>" and "<vendor email>"
    Then the vendor is added successfully
    And I update the Meeting ID to "<meeting ID>"
    Then no validation or system errors occur during any workflow

    Examples:
      | chemical name   | chemical type | proppant name    | proppant type | vendor name     | vendor email           | meeting ID  |
      | ChemA           | Type1         | PropA            | TypeA        | VendorA         | vendorA@example.com    | Meeting123  |
      | ChemB           | Type2         | PropB            | TypeB        | VendorB         | vendorB@example.com    | Meeting456  |

  @feature_user_login
  @validate_navigate_setup_screens
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    When the user navigates to the Jobs section
    And the user selects a Job from the list
    And the user chooses a Well associated with the Job
    And the user selects a Stage for the Job
    And the user clicks on the Chemical Setup option
    Then the Chemical Setup screen loads successfully
    When the user clicks on the Proppant Setup option
    Then the Proppant Setup screen loads successfully
    When the user clicks on the Email Setup option
    Then the Email Setup screen loads successfully

    Examples:
      | job      | well      | stage     |
      | Job1     | Well1     | Stage1    |
      | Job2     | Well2     | Stage2    |

  @feature_user_login
  @add_acid
  Scenario Outline: Chemical Setup for Acid
    When the user clicks on the "Add Chemical" button
    And the user selects "<chemical_name>" from the chemical name dropdown
    And the user enters "<design_concentration>"
    And the user enters "<designed_volume>"
    And the user clicks on the "Save" button
    And the user refreshes the Chemical Setup screen
    Then the added Acid should appear in the list

    Examples:
      | chemical_name | design_concentration | designed_volume |
      | Acid          | 15%                  | 1000 liters     |

  @feature_email_setup
  @validate_email_setup
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    When I add a Chemical vendor with the name "<chemical_vendor>" and PO number "<chemical_po>"
    And I add a Proppant vendor with the name "<proppant_vendor>" and PO number "<proppant_po>"
    And I configure email recipients with "<email1>" and "<email2>"
    And I update the Meeting ID to "<meeting_id>"
    And I click on the "Save" button
    Then the Email Setup screen should refresh
    And all configurations should be displayed correctly

    Examples:
      | chemical_vendor        | chemical_po | proppant_vendor        | proppant_po | email1                   | email2                    | meeting_id |
      | chemical vendor inc    | PO123456    | proppant vendor llc    | PO654321    | recipient1@example.com   | recipient2@example.com    | 12345      |

  @feature_user_login
  @add_slickwater
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    Given the user is on the Chemical Setup screen
    When the user clicks on the "Add Chemical" button
    And the user selects "<chemical_name>" from the chemical name dropdown
    And the user enters a valid design concentration of "<design_concentration>"
    And the user enters a valid designed volume of "<designed_volume>"
    And the user clicks on the "Save" button
    And the user refreshes the Chemical Setup screen
    Then the added "<chemical_name>" appears in the list

    Examples:
      | chemical_name | design_concentration | designed_volume |
      | Slickwater    | 20%                  | 500 liters      |

  @feature_user_login
  @valid-delivery-record
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    When the user clicks on the "Create Delivery Record" button
    And the user selects "<vendor>" from the vendor dropdown
    And the user enters a valid PO number "<po_number>"
    And the user selects "<chemical_type>" from the dropdown
    And the user enters a valid BOL number "<bol_number>"
    And the user enters a valid received quantity "<received_quantity>" and UOM "<uom>"
    And the user clicks on the "Save" button
    Then the delivery record is saved successfully in the database

    Examples:
      | vendor          | po_number   | chemical_type | bol_number  | received_quantity | uom |
      | abcd pvt.ltd    | PO123456   | Chemical A    | BOL78910    | 100              | kg  |

  @feature_user_login
  @add_proppant
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    When the user clicks on the "Add Proppant" button
    And the user selects "<proppant_name>" from the dropdown
    And the user enters "<total_design_volume>"
    And the user clicks on the "Save" button
    Then the user should see the "<proppant_name>" in the Proppant Setup list

    Examples:
      | proppant_name | total_design_volume |
      | Sand          | 2000 lbs            |
      | Sand          | 2000 lbs            |
      | Sand          | 2000 lbs            |
      | Sand          | 2000 lbs            |

  @refresh_proppant_list
  Scenario Outline: Verify all added Proppants appear in the list
    When the user refreshes the Proppant Setup screen
    Then the user should see all added Proppants in the Proppant Setup list

    Examples:
      | proppant_name |
      | Sand          |
      | Sand          |
      | Sand          |
      | Sand          |

  @feature_accessibility_validation
  @validate_accessibility_features
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    When I navigate to the Chemical Setup screen
    Then the Chemical Setup screen is displayed
    And I use keyboard navigation to access all fields and buttons
    And ARIA roles and labels for each UI element are verified
    When I navigate to the Proppant Setup screen
    Then the Proppant Setup screen is displayed
    And I use keyboard navigation to access all fields and buttons
    When I navigate to the Email Setup screen
    Then the Email Setup screen is displayed
    And I use keyboard navigation to access all fields and buttons
    Then screen reader support is functional for all UI elements

    Examples:
      | step_action                                      |
      | Navigate to the Chemical Setup screen           |
      | Use keyboard navigation to access all fields     |
      | Verify ARIA roles and labels for each UI element |
      | Navigate to the Proppant Setup screen            |
      | Use keyboard navigation to access all fields     |
      | Navigate to the Email Setup screen               |
      | Use keyboard navigation to access all fields     |
      | Verify screen reader support for all UI elements  |

  @feature_user_login
  @add_chemical_vendor
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    When the user clicks on the "Add Vendor" button
    And the user selects "Chemical Vendor" from the vendor type dropdown
    And the user enters a valid PO number "<po_number>"
    And the user clicks on the "Save" button
    And the user refreshes the Email Setup screen
    Then the added Chemical vendor should appear in the list
    And the PO number should be displayed correctly

    Examples:
      | po_number |
      | PO12345   |

  @feature_user_login
  @valid_delivery_record
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    Given the user clicks on the "Create Delivery Record" button
    When the user selects "<vendor>" from the vendor dropdown
    And the user enters "<PO_number>" as the PO number
    And the user selects "<chemical_type>" from the chemical type dropdown
    And the user enters "<BOL_number>" as the BOL number
    And the user enters "<received_quantity>" as the received quantity
    And the user selects "<UOM>" as the UOM
    And the user clicks on the "Save" button
    Then the delivery record should be saved successfully with correct values

    Examples:
      | vendor        | PO_number | chemical_type        | BOL_number   | received_quantity | UOM |
      | vendor_name   | 123456    | chemical_type_name   | BOL123456    | 100              | kg  |

  @feature_user_login
  @update_meeting_id
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    Given the user locates the Meeting ID field under "Others"
    When the user enters a new valid Meeting ID "<meeting_id>"
    And the user clicks on the "Save" button
    And the user refreshes the Email Setup screen
    Then the updated Meeting ID is displayed correctly
    And no validation errors occur
    And the UI remains responsive

    Examples:
      | meeting_id |
      | MEET123    |

  @feature_user_login
  @validate_large_number_of_entries
  Scenario Outline: Chemical Setup can handle large number of entries
    When the user adds 100 chemical entries with valid details
    And the user clicks on the "Save" button after each entry
    And the user refreshes the Chemical Setup screen
    Then all 100 entries should be displayed correctly
    And the user scrolls through the list of chemicals
    Then the screen should respond without lag
    And there should be no errors during the process

    Examples:
      | <chemical_entry> |
      | 1                |
      | 2                |
      | 3                |
      | 4                |
      | 5                |
      | 6                |
      | 7                |
      | 8                |
      | 9                |
      | 10               |
      | ...              |
      | 100              |

  @feature_user_login
  @create_delivery_record
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    When I click on the "Create Delivery Record" button
    And I select "<vendor>" from the vendor dropdown
    And I select "<PO>" from the PO dropdown
    And I select "<chemical_type>" from the chemical type dropdown
    And I enter a valid BOL number "<BOL_number>"
    And I enter a valid received quantity "<received_quantity>"
    And I click on the "Save" button
    Then the delivery record is saved successfully

    Examples:
      | vendor         | PO        | chemical_type | BOL_number | received_quantity |
      | abcd pvt.ltd   | PO123456  | Chemical A    | BOL12345   | 100 liters       |

  @feature_user_login
  @validate_design_values
  Scenario Outline: Chemical Setup for Job Stages with Minimum and Maximum Values
    When the user clicks on the "Add Chemical" button
    And the user selects "<chemical_name>" from the dropdown
    And the user enters "<design_concentration>" as the design concentration
    And the user enters "<designed_volume>" as the designed volume
    And the user clicks on the "Save" button
    Then the chemical should be saved successfully

    Examples:
      | chemical_name      | design_concentration | designed_volume |
      | sodium chloride    | 0.1                 | 1               |
      | sodium chloride    | 1                   | 0.1             |

  @feature_user_login
  @validate_dropdown_options
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    When I click on the chemical name dropdown
    Then all expected chemical options are displayed correctly
    When I navigate to the Proppant Setup screen
    Then the Proppant Setup screen is displayed
    When I click on the Proppant name dropdown
    Then all expected Proppant options are displayed correctly
    When I navigate to the Email Setup screen
    Then the Email Setup screen is displayed
    When I click on the vendor type dropdown
    Then the vendor type dropdown is opened

    Examples:
      | chemical_name | proppant_name | vendor_type |
      | Chemical A    | Proppant X    | Vendor 1    |

  @feature_user_login
  @concurrent_access
  Scenario Outline: Chemical Setup for Multiple Users
    When User A adds a chemical entry and clicks "Save"
    And User B adds a different chemical entry and clicks "Save"
    And both users refresh their screens
    Then both entries are displayed correctly for each user
    And there are no data conflicts or errors
    And both users can continue to add more entries

    Examples:
      |         |
      |         |

  @feature_user_login
  @validate_setup_buttons
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    When I click on the "Add Chemical" button
    And I fill in the required fields with "<company_name>", "<name>", "<email>", "<proposal_ID>", "<opportunity_name>", "<sales_engineer_name>", "<phone_number>", "<date>", "<time_period>", "<status>"
    And I click "Save"
    Then the chemical should be saved successfully
    When I click on the "Save & New" button
    And I fill in the required fields for a new chemical with "<company_name>", "<name>", "<email>", "<proposal_ID>", "<opportunity_name>", "<sales_engineer_name>", "<phone_number>", "<date>", "<time_period>", "<status>"
    And I click "Save"
    Then the new chemical should be saved successfully
    When I navigate to the Proppant Setup screen
    Then the Proppant Setup screen is displayed
    When I click on the "Add Proppant" button
    And I fill in the fields with "<company_name>", "<name>"
    And I click "Save"
    Then the proppant should be saved successfully

    Examples:
      | company_name  | name    | email              | proposal_ID | opportunity_name | sales_engineer_name | phone_number | date        | time_period   | status      |
      | abcd pvt.ltd  | krishna | krishna@gmail.com  | 231235      | ramu             | ramu                | 9876543210   | 12/5/2025   | 1 month ago   | contacted   |

  @feature_user_login
  @valid-chemical-setup
  Scenario Outline: Chemical Setup with Unusual Combinations
    Given the user is on the Chemical Setup screen
    When the user clicks on the "Add Chemical" button
    And the user selects "<chemical_name>" from the dropdown
    And the user enters "<design_concentration>"
    And the user enters "<designed_volume>"
    And the user clicks on the "Save" button
    And the user refreshes the Chemical Setup screen
    Then the unusual combination should be displayed correctly

    Examples:
      | chemical_name      | design_concentration | designed_volume |
      | Sodium Hydroxide   | 12.5%               | 250 mL         |

  @feature_user_login
  @valid_setup_workflow
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    Given the user navigates to the Chemical Setup screen
    Then the Chemical Setup screen is displayed
    When the user adds a valid chemical "<chemical_name>" and saves it
    Then the chemical is added successfully without errors
    Given the user navigates to the Proppant Setup screen
    Then the Proppant Setup screen is displayed
    When the user adds a valid Proppant "<proppant_name>" and saves it
    Then the proppant is added successfully without errors
    Given the user navigates to the Email Setup screen
    Then the Email Setup screen is displayed
    When the user adds a valid vendor "<vendor_email>" and saves it
    Then the vendor is added successfully without errors
    Given the user navigates to the Chemical Delivery Tracking screen
    Then the Chemical Delivery Tracking screen is displayed
    When the user creates a valid delivery record "<delivery_record>" and saves it
    Then the delivery record is created successfully without errors

    Examples:
      | chemical_name      | proppant_name      | vendor_email          | delivery_record |
      | sodium chloride    | ceramic proppant   | vendor@example.com    | delivery123     |

  @feature_user_login
  @invalid-inputs
  Scenario Outline: Chemical Setup with Invalid Inputs
    Given the user clicks on the "Add Chemical" button
    When the user selects a chemical name from the dropdown
    And the user enters an invalid design concentration "<design_concentration>"
    And the user enters an invalid designed volume "<designed_volume>"
    And the user clicks on the "Save" button
    Then error messages should be displayed for both fields

    Examples:
      | design_concentration | designed_volume |
      | -5                   | non-numeric     |

  @valid-inputs
  Scenario Outline: Chemical Setup with Valid Inputs
    Given the user clicks on the "Add Chemical" button
    When the user selects a chemical name from the dropdown
    And the user enters a valid design concentration "<valid_design_concentration>"
    And the user enters a valid designed volume "<valid_designed_volume>"
    And the user clicks on the "Save" button
    Then the chemical should be saved successfully

    Examples:
      | valid_design_concentration | valid_designed_volume |
      | 10                        | 100                   |

  @feature_user_login
  @validate_accessibility
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    Given the user navigates to the <setup_screen> Setup screen
    When the user uses keyboard navigation to focus on the first input field
    Then the input field should have an appropriate ARIA label
    And the user uses the Tab key to navigate through all fields
    Then all fields should be accessible via keyboard

  Examples:
    | setup_screen |
    | Chemical     |
    | Proppant     |
    | Email        |

  @feature_user_login
  @unauthorized_access
  Scenario Outline: Validate Unauthorized Access to Setup Screens
    When I attempt to navigate to the <screen> Setup screen
    Then access should be denied with a 403 error
    And an appropriate error message should be displayed

  Examples:
    | screen    |
    | Chemical  |
    | Proppant  |
    | Email     |

  @feature_chemical_setup
  @validate_chemical_setup
  Scenario Outline: Chemical Setup for Job Stages
    When the user clicks on the "Add Chemical" button
    And the user selects "<chemical_name>" from the chemical name dropdown
    And the user enters "<design_concentration>" as the design concentration
    And the user enters "<designed_volume>" as the designed volume
    And the user clicks on the "Save" button
    Then the Chemical Setup screen refreshes without errors
    And the Diverters entry shows the correct values

    Examples:
      | chemical_name | design_concentration | designed_volume |
      | Diverters     | 10%                  | 800 liters      |

  @feature_email_setup
  @validate_error_messages
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    When the user clicks on the "Add Vendor" button
    And the user leaves the PO number field empty
    And the user clicks on the "Save" button
    Then an error message should be displayed for the PO number field
    And the vendor is not saved due to the missing PO number
    When the user enters a valid PO number
    And the user leaves the vendor type empty
    And the user clicks on the "Save" button
    Then an error message should be displayed for the vendor type field
    And the vendor is not saved due to the missing vendor type

    Examples:
      | PO number | vendor type |
      |           |              |

  @feature_user_login
  @validate_proppant_setup
  Scenario Outline: Validate Proppants in Proppant Setup
    When I click on the "Add Proppant" button
    And I select a Proppant name from the dropdown
    And I enter a valid total design volume "<total_design_volume>"
    And I click on the "Save" button
    And I refresh the Proppant Setup screen
    Then the Proppant entry shows the correct values
    And the total design volume is displayed correctly

    Examples:
      | total_design_volume |
      | 1500 lbs           |

  @feature_email_setup
  @invalid_email_input
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    Given the user clicks on the first Email Address field
    When the user enters "<first_email>"
    And the user clicks on the "Save" button
    Then an error message should be displayed for the email address field
    Given the user clicks on the second Email Address field
    When the user enters "<second_email>"
    And the user clicks on the "Save" button
    Then an error message should be displayed for the second email address field

    Examples:
      | first_email      | second_email      |
      | abc@              | abc@              |
      | krishna@gmail.com | abc@              |

  @feature_user_login
  @validate_vendor_email_setup
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    Given the user is on the Email Setup screen
    When I click on the "Add Vendor" button
    And I select "Proppant Vendor" from the vendor type dropdown
    And I enter a valid PO number "<po_number>"
    And I click on the "Save" button
    And I refresh the Email Setup screen
    Then the Proppant vendor entry should show the correct values
    And the PO number should be displayed correctly

    Examples:
      | po_number |
      | PO67890   |

  @feature_user_login
  @validate_api_call
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    When the user clicks on the "Add Chemical" button
    And the user selects "<chemical_name>" from the chemical name dropdown
    And the user enters a valid design concentration "<design_concentration>"
    And the user enters a valid designed volume "<designed_volume>"
    And the user clicks on the "Save" button
    And the user monitors the network tab for API call
    Then the API call should return a success response

    Examples:
      | chemical_name | design_concentration | designed_volume |
      | Linear Gel    | 25%                  | 1200 liters     |

  @feature_user_login
  @invalid-bol-error
  Scenario Outline: Validate Error Message for Invalid BOL Number
    Given the user clicks on the "Create Delivery Record" button
    When the user selects "<vendor>" from the vendor dropdown
    And the user enters "<po_number>" as the PO number
    And the user selects "<chemical_type>" from the chemical type dropdown
    And the user enters "<bol_number>" as the BOL number
    And the user clicks on the "Save" button
    Then an error message should be displayed for the BOL number field

    Examples:
      | vendor         | po_number | chemical_type | bol_number   |
      | abcd pvt.ltd   | 123456    | Chemical A    | !@#$%^&*     |

  @feature_user_login
  @valid_proppant_setup
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    When the user clicks on the "Add Proppant" button
    And the user selects a Proppant name from the dropdown
    And the user enters "<total_design_volume>"
    And the user clicks on the "Save" button
    And the user monitors the network tab for API call
    Then the API call should return a success response
    And the Proppant should be displayed in the list

    Examples:
      | total_design_volume |
      | 3000 lbs           |

  @feature_user_login
  @invalid-received-quantity
  Scenario Outline: Validate Error Messages for Invalid Received Quantities
    Given the user clicks on the "Create Delivery Record" button
    And the user selects "<vendor>" from the vendor dropdown
    And the user enters "<po_number>" as a valid PO number
    And the user selects "<chemical_type>" from the dropdown
    And the user enters "<received_quantity>" as the received quantity
    When the user clicks on the "Save" button
    Then an error message for the received quantity field should be displayed

    Examples:
      | vendor          | po_number | chemical_type | received_quantity |
      | abcd pvt.ltd   | 123456    | Chemical A    | -5                |

  @feature_user_login
  @invalid_uom_error
  Scenario Outline: Chemical Delivery Tracking with Invalid UOM
    Given the user clicks on the "Create Delivery Record" button
    When the user selects "<vendor>" from the vendor dropdown
    And the user enters a valid PO number "<po_number>"
    And the user selects a chemical type "<chemical_type>" from the dropdown
    And the user enters a valid BOL number "<bol_number>"
    And the user enters an invalid UOM "<invalid_uom>"
    And the user clicks on the "Save" button
    Then the user should see an error message for the invalid UOM
    And the delivery record should not be saved

    Examples:
      | vendor         | po_number | chemical_type | bol_number | invalid_uom    |
      | abcd pvt.ltd   | 123456    | Chemical A    | BOL12345   | invalid_unit    |

  @feature_user_login
  @add_vendor
  Scenario Outline: Chemical Vendor Email Setup
    When the user clicks on the "Add Vendor" button
    And the user selects "Chemical Vendor" from the vendor type dropdown
    And the user enters a valid PO number "<po_number>"
    And the user clicks on the "Save" button
    And the user monitors the network tab for the API call
    Then the API call should return a success response
    And the vendor should be displayed in the list

    Examples:
      | po_number |
      | PO54321   |

  @feature_user_login
  @create_delivery_record
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    When the user clicks on the "Create Delivery Record" button
    And the user selects "<vendor>" from the vendor dropdown
    And the user selects "<PO>" from the PO dropdown
    And the user selects "<chemical_type>" from the chemical type dropdown
    And the user enters a valid BOL number "<BOL_number>"
    And the user enters a valid received quantity "<received_quantity>"
    And the user clicks on the "Save" button
    Then the API call is made successfully and returns a success response

    Examples:
      | vendor        | PO      | chemical_type | BOL_number | received_quantity |
      | vendor_name   | PO12345 | Chemical A    | BOL98765   | 150               |

  @feature_user_login
  @empty_fields_error
  Scenario Outline: Validate Error Messages for Empty Fields
    When the user clicks on the "Create Delivery Record" button
    And the vendor dropdown is left empty
    And the user clicks on the "Save" button
    Then an error message for the vendor field should be displayed

    When the user enters a valid vendor and leaves the PO number empty
    And the user clicks on the "Save" button
    Then an error message for the PO number field should be displayed

    Examples:
      | vendor        | po_number |
      |               |           |
      | ValidVendor   |           |

  @feature_user_login
  @check_access_denied
  Scenario Outline: Validate Unauthorized Access to Chemical Delivery Tracking and Setup Screens
    When I attempt to navigate to the "<screen>"
    Then access is denied with a 403 error
    And an appropriate error message is displayed

    Examples:
      | screen                      |
      | Chemical Delivery Tracking   |
      | Chemical Setup              |
      | Proppant Setup              |

  @feature_user_login
  @invalid_design_concentration
  Scenario Outline: Verify Error Message for Invalid Design Concentration
    When the user clicks on the "Add Chemical" button
    And the user selects "<chemical_name>" from the chemical name dropdown
    And the user enters "<design_concentration>" as the design concentration
    And the user enters "<designed_volume>" as the designed volume
    And the user clicks on the "Save" button
    Then an error message should be displayed indicating invalid concentration
    And the chemical should not be added to the list

    Examples:
      | chemical_name | design_concentration | designed_volume |
      | Acid          | -5%                  | 1000 liters     |

  @invalid_total_design_volume
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    When the user clicks on the "Add Proppant" button
    And the user selects a Proppant name from the dropdown
    And the user enters "<total_design_volume>" lbs
    And the user clicks on the "Save" button
    Then an error message is displayed indicating invalid volume
    And the Proppant is not added to the list
    And the UI remains responsive

    Examples:
      | total_design_volume |
      | 0                   |

  @feature_user_login
  @max_character_limits
  Scenario Outline: Validate Maximum Character Limits for Chemical Setup
    Given the user clicks on the "Add Chemical" button
    When the user enters a chemical name with maximum allowed characters "<chemical_name>"
    And the user enters the maximum valid design concentration "<design_concentration>"
    And the user enters the maximum valid designed volume "<designed_volume>"
    And the user clicks on the "Save" button
    And the user refreshes the Chemical Setup screen
    Then the chemical with maximum values is displayed correctly

    Examples:
      | chemical_name                                                                                                                                         | design_concentration | designed_volume |
      | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa | 100                 | 1000            |

  @feature_user_login
  @error_vendor_without_po
  Scenario Outline: Verify error message when adding vendor without PO number
    When the user clicks on the "Add Vendor" button
    And the user selects "Chemical Vendor" from the vendor type dropdown
    And the user leaves the PO number field empty
    And the user clicks on the "Save" button
    Then an error message should be displayed indicating PO number is required
    And the vendor should not be added to the list
    And the UI should remain responsive

    Examples:
      | PO number |
      |           |

  @feature_user_login
  @minimum_character_limits
  Scenario Outline: Chemical Setup for Job Stages with Minimum Values
    When the user clicks on the "Add Chemical" button
    And the user enters a chemical name "<chemical_name>"
    And the user enters a design concentration "<design_concentration>"
    And the user enters a designed volume "<designed_volume>"
    And the user clicks on the "Save" button
    And the user refreshes the Chemical Setup screen
    Then the chemical with minimum values should be displayed correctly

    Examples:
      | chemical_name | design_concentration | designed_volume |
      | H2            | 0.1                  | 0.5             |

  @feature_user_login
  @invalid_bol
  Scenario Outline: Chemical Delivery Record with Invalid BOL Number Format
    When the user clicks on the "Create Delivery Record" button
    And the user selects a vendor from the vendor dropdown
    And the user selects a PO from the PO dropdown
    And the user selects a chemical type from the chemical type dropdown
    And the user enters an invalid BOL number "<bol_number>"
    And the user enters a valid received quantity "<received_quantity>"
    And the user clicks on the "Save" button
    Then the error message is displayed indicating invalid BOL number format

    Examples:
      | bol_number | received_quantity |
      | !@#$%^&*  | 100               |

  @feature_user_login
  @validate_special_characters
  Scenario Outline: Validate Chemical Setup with Special Characters
    Given the user clicks on the "Add Chemical" button
    When the user enters a chemical name with special characters "<chemical_name>"
    And the user enters a valid design concentration with special characters "<design_concentration>"
    And the user enters a valid designed volume with special characters "<designed_volume>"
    And the user clicks on the "Save" button
    And the user refreshes the Chemical Setup screen
    Then the chemical with special characters is displayed correctly after refresh

    Examples:
      | chemical_name          | design_concentration    | designed_volume        |
      | !@#$%^&*()_+          | !@#$%^&*()_+          | !@#$%^&*()_+          |

  @feature_user_login
  @error_message_displayed
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    Given the user clicks on the "Add Chemical" button
    And leaves all fields empty
    When the user clicks on the "Save" button
    Then error messages are displayed for each required field
    And the chemical is not added to the list
    And the UI remains responsive
    And the user can navigate away without issues

    Examples:
      | field name |
      |            |
      |            |
      |            |
      |            |
      |            |

  @feature_user_login
  @validate_large_numbers
  Scenario Outline: Chemical Setup handles large design concentration and volume
    When the user clicks on the "Add Chemical" button
    And the user enters "<chemical_name>"
    And the user enters "<design_concentration>"
    And the user enters "<designed_volume>"
    And the user clicks on the "Save" button
    And the user refreshes the Chemical Setup screen
    Then the chemical with large numbers should be displayed correctly

    Examples:
      | chemical_name      | design_concentration | designed_volume |
      | sodium chloride    | a * 1000000         | a * 1000000    |

  @feature_user_login
  @duplicate_chemical_entry
  Scenario Outline: Verify Duplicate Chemical Entry Error
    Given the user clicks on the "Add Chemical" button
    When the user selects "<chemical_name>" from the chemical name dropdown
    And the user enters a valid design concentration "<design_concentration>"
    And the user enters a valid designed volume "<designed_volume>"
    And the user clicks on the "Save" button
    And the user clicks on the "Add Chemical" button
    When the user selects "<chemical_name>" from the chemical name dropdown
    And the user enters a valid design concentration "<design_concentration>"
    And the user enters a valid designed volume "<designed_volume>"
    And the user clicks on the "Save" button
    Then an error message is displayed indicating duplicate entry

    Examples:
      | chemical_name | design_concentration | designed_volume |
      | Slickwater    | 20%                  | 500 liters      |

  @feature_user_login
  @empty_fields_validation
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    When the user clicks on the "Add Proppant" button
    And the user leaves the Proppant name field empty
    And the user enters a valid total design volume "<total_design_volume>"
    And the user clicks on the "Save" button
    Then an error message should be displayed for the Proppant name field

    When the user enters a valid Proppant name "<proppant_name>" 
    And the user leaves the total design volume field empty
    And the user clicks on the "Save" button
    Then an error message should be displayed for the total design volume field

    Examples:
      | proppant_name     | total_design_volume |
      |                   | 1000                |
      | abcd proppant     |                     |

  @feature_user_login
  @duplicate_proppant_error
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    When the user clicks on the "Add Proppant" button
    And the user selects "<proppant_name>" from the dropdown
    And the user enters "<total_design_volume>"
    And the user clicks on the "Save" button
    And the user clicks on the "Add Proppant" button
    And the user selects "<proppant_name>" from the dropdown
    And the user enters "<total_design_volume>"
    And the user clicks on the "Save" button
    Then the user should see an error message indicating duplicate entry
    And the Proppant should not be added twice

    Examples:
      | proppant_name      | total_design_volume |
      | duplicate Proppant | 2000 lbs           |

  @feature_user_login
  @max_proppant_entries
  Scenario Outline: Validate Proppant Setup for Maximum Entries
    When I add a Proppant with company name "<company_name>", proposal ID "<proposal_id>", opportunity name "<opportunity_name>", sales engineer name "<sales_engineer_name>", phone number "<phone_number>", date "<date>", and status "<status>"
    And I click on the "Save" button
    And I repeat the process three more times with different valid details
    And I refresh the Proppant Setup screen
    Then all four Proppant entries should be displayed correctly
    And scrolling through the list of Proppants is smooth and responsive
    And no performance issues should be encountered
    And no errors should occur during the process

    Examples:
      | company_name     | proposal_id | opportunity_name | sales_engineer_name | phone_number | date       | status     |
      | abcd pvt.ltd    | 231235      | ramu             | ramu                | 9876543210   | 12/5/2025  | contacted  |
      | abcd pvt.ltd    | 231236      | ramu             | ramu                | 9876543210   | 12/5/2025  | contacted  |
      | abcd pvt.ltd    | 231237      | ramu             | ramu                | 9876543210   | 12/5/2025  | contacted  |
      | abcd pvt.ltd    | 231238      | ramu             | ramu                | 9876543210   | 12/5/2025  | contacted  |

  @feature_user_login
  @error_message_required_fields
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    When the user clicks on the "Add Vendor" button
    And the user leaves all fields empty
    And the user clicks on the "Save" button
    Then error messages should be displayed for each required field
    And the vendor should not be added to the list
    And the UI should remain responsive
    And the user can still navigate away

  Examples:
    | field name |
    |            |
    |            |
    |            |
    |            |

  @feature_user_login
  @unusual_proppant_combination
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    When the user clicks on the "Add Proppant" button
    And the user enters a Proppant name with unusual characters "<proppant_name>"
    And the user enters a valid total design volume "<total_design_volume>"
    And the user clicks on the "Save" button
    And the user refreshes the Proppant Setup screen
    Then the Proppant with unusual combination should be displayed correctly

    Examples:
      | proppant_name        | total_design_volume |
      | ProppantName1       | 1000                |
      | ProppantName2       | 2000                |

  @feature_user_login
  @error_message_displayed
  Scenario Outline: Verify Error Messages for Required Fields in Delivery Record
    When the user clicks on the "Create Delivery Record" button
    And the user leaves all fields empty
    And the user clicks on the "Save" button
    Then error messages should be displayed for each required field
    And the delivery record should not be created
    And the UI should remain responsive
    And the user can navigate away without issues

    Examples:
      | field name |
      |            |
      |            |
      |            |
      |            |
      |            |

  @feature_email_setup
  @empty_fields_validation
  Scenario Outline: Validate Email Setup Screen Handles Empty Fields
    Given the user clicks on the "Add Vendor" button
    When the vendor type field is "<vendor_type>"
    And the PO number is "<po_number>"
    And the user clicks on the "Save" button
    Then an error message is displayed for the vendor type field if "<vendor_type>" is empty
    And the vendor is not saved due to the missing type if "<vendor_type>" is empty
    And the PO number field is editable
    Then an error message is displayed for the PO number field if "<po_number>" is empty
    And the vendor is not saved due to the missing PO number if "<po_number>" is empty

    Examples:
      | vendor_type | po_number |
      |             | 123456   |
      | ValidType   |           |

  @feature_user_login
  @invalid_email_format
  Scenario Outline: Verify error message for invalid email format
    Given the user clicks on the "Add Vendor" button
    When the user enters "<email_address>" in the Email Address field
    And the user enters "<po_number>" in the PO Number field
    And the user clicks on the "Save" button
    Then an error message should be displayed for the email format
    And the vendor should not be added to the list
    And the UI should remain responsive

    Examples:
      | email_address | po_number |
      | invalidemail  | PO12345  |
      | abc@          | PO12345  |

  @feature_email_setup
  @validate_email_handling
  Scenario Outline: Validate Email Setup Can Handle Maximum Email Addresses
    When I add email address <email> to the Email Setup
    And I click on the "Save" button after the entry
    And I refresh the Email Setup screen
    Then all email addresses should be displayed correctly
    And scrolling through the list of email addresses should be smooth and responsive
    And no performance issues should be encountered
    And no errors should occur during the process

    Examples:
      | email                    |
      | a@domain.com            |
      | a@domain.com            |
      | a@domain.com            |
      | a@domain.com            |
      | a@domain.com            |
      | a@domain.com            |
      | a@domain.com            |
      | a@domain.com            |
      | a@domain.com            |
      | a@domain.com            |
      | ... (up to 1000 times)  |

  @feature_user_login
  @negative_received_quantity
  Scenario Outline: Verify error message for negative received quantity
    When the user clicks on the "Create Delivery Record" button
    And the user selects "<vendor>" from the vendor dropdown
    And the user selects "<po>" from the PO dropdown
    And the user selects "<chemicalType>" from the chemical type dropdown
    And the user enters a valid BOL number "<bol>"
    And the user enters "<receivedQuantity>" as the received quantity
    And the user clicks on the "Save" button
    Then the error message should be displayed indicating invalid received quantity

    Examples:
      | vendor          | po        | chemicalType | bol        | receivedQuantity |
      | abcd pvt.ltd   | PO12345  | Chemical A   | BOL12345  | -50              |

  @feature_user_login
  @valid_vendor_setup
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    When the user clicks on the "Add Vendor" button
    And the user enters a vendor type with unusual characters "<vendor_type>"
    And the user enters a valid PO number "<po_number>"
    And the user clicks on the "Save" button
    Then the vendor is saved successfully
    And the user refreshes the Email Setup screen
    Then the vendor with unusual combination is displayed correctly

    Examples:
      | vendor_type     | po_number     |
      | !@#$%^&*()     | 1234567890    |

  @feature_user_login
  @add_maximum_proppants
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    When the user clicks on the "Add Proppant" button
    And the user selects the "<proppant_name>" from the dropdown
    And the user enters "<total_design_volume>"
    And the user clicks on the "Save" button
    Then the user should see a confirmation that the Proppant is saved successfully

    Examples:
      | proppant_name | total_design_volume |
      | Proppant1     | 1000 lbs           |
      | Proppant2     | 1000 lbs           |
      | Proppant3     | 1000 lbs           |
      | Proppant4     | 1000 lbs           |

  @verify_proppants_display
  Scenario: Verify all Proppants appear in the list
    When the user refreshes the Proppant Setup screen
    Then the user should see all four Proppants appear in the list

  @feature_user_login
  @max_character_limits
  Scenario Outline: Chemical Setup with Maximum Character Limits
    When the user clicks on the "Add Chemical" button
    And the user enters a chemical name with maximum allowed characters
    And the user enters the maximum valid design concentration
    And the user enters the maximum valid designed volume
    And the user clicks on the "Save" button
    And the user refreshes the Chemical Setup screen
    Then the chemical with maximum values should be displayed correctly

    Examples:
      | Chemical Name                                                                                                                                                                                                 | Design Concentration | Designed Volume |
      | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa | 100                | 1000             |

  @feature_user_login
  @add_chemicals
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    When the user clicks on the "Add Chemical" button
    And the user selects a chemical name from the dropdown
    And the user enters "<design_concentration>"
    And the user enters "<designed_volume>"
    And the user clicks on the "Save" button
    Then the user verifies that all added Chemicals appear in the list

    Examples:
      | design_concentration | designed_volume |
      | 15%                  | 1000 liters     |

  @feature_user_login
  @min_character_limits
  Scenario Outline: Validate Chemical Setup for Minimum Values
    When the user clicks on the "Add Chemical" button
    And the user enters a chemical name with the minimum allowed characters as "<chemical_name>"
    And the user enters the minimum valid design concentration as "<design_concentration>"
    And the user enters the minimum valid designed volume as "<designed_volume>"
    And the user clicks on the "Save" button
    Then the chemical should be saved successfully
    And the Chemical Setup screen should refresh without errors
    And the chemical with minimum values is displayed correctly after refresh

    Examples:
      | chemical_name | design_concentration | designed_volume |
      | H2            | 0.1                 | 0.5             |

  @feature_user_login
  @validate_special_characters
  Scenario Outline: Chemical Setup with Special Characters
    Given the user clicks on the "Add Chemical" button
    When the user enters a chemical name "<chemical_name>"
    And the user enters a design concentration "<design_concentration>"
    And the user enters a designed volume "<designed_volume>"
    And the user clicks on the "Save" button
    Then the Chemical Setup screen refreshes without errors
    And the chemical with special characters is displayed correctly after refresh

    Examples:
      | chemical_name       | design_concentration | designed_volume     |
      | !@#$%^&*()_+       | !@#$%^&*()_+        | !@#$%^&*()_+       |

  @feature_user_login
  @performance_test_large_chemicals
  Scenario Outline: Chemical Setup for Job Stages with Large Number of Chemicals
    When the user clicks on the "Add Chemical" button
    And the user selects "<chemical_name>" from the dropdown
    And the user enters a valid design concentration "<design_concentration>"
    And the user enters a valid designed volume "<designed_volume>"
    And the user clicks on the "Save" button
    Then the chemical should be saved successfully

    Examples:
      | chemical_name | design_concentration | designed_volume |
      | Chemical1     | 10%                  | 500 liters      |
      | Chemical2     | 10%                  | 500 liters      |
      | Chemical3     | 10%                  | 500 liters      |
      | Chemical4     | 10%                  | 500 liters      |
      | Chemical5     | 10%                  | 500 liters      |
      | Chemical6     | 10%                  | 500 liters      |
      | Chemical7     | 10%                  | 500 liters      |
      | Chemical8     | 10%                  | 500 liters      |
      | Chemical9     | 10%                  | 500 liters      |
      | Chemical10    | 10%                  | 500 liters      |
      | Chemical11    | 10%                  | 500 liters      |
      | Chemical12    | 10%                  | 500 liters      |
      | Chemical13    | 10%                  | 500 liters      |
      | Chemical14    | 10%                  | 500 liters      |
      | Chemical15    | 10%                  | 500 liters      |
      | Chemical16    | 10%                  | 500 liters      |
      | Chemical17    | 10%                  | 500 liters      |
      | Chemical18    | 10%                  | 500 liters      |
      | Chemical19    | 10%                  | 500 liters      |
      | Chemical20    | 10%                  | 500 liters      |
      | Chemical21    | 10%                  | 500 liters      |
      | Chemical22    | 10%                  | 500 liters      |
      | Chemical23    | 10%                  | 500 liters      |
      | Chemical24    | 10%                  | 500 liters      |
      | Chemical25    | 10%                  | 500 liters      |
      | Chemical26    | 10%                  | 500 liters      |
      | Chemical27    | 10%                  | 500 liters      |
      | Chemical28    | 10%                  | 500 liters      |
      | Chemical29    | 10%                  | 500 liters      |
      | Chemical30    | 10%                  | 500 liters      |
      | Chemical31    | 10%                  | 500 liters      |
      | Chemical32    | 10%                  | 500 liters      |
      | Chemical33    | 10%                  | 500 liters      |
      | Chemical34    | 10%                  | 500 liters      |
      | Chemical35    | 10%                  | 500 liters      |
      | Chemical36    | 10%                  | 500 liters      |
      | Chemical37    | 10%                  | 500 liters      |
      | Chemical38    | 10%                  | 500 liters      |
      | Chemical39    | 10%                  | 500 liters      |
      | Chemical40    | 10%                  | 500 liters      |
      | Chemical41    | 10%                  | 500 liters      |
      | Chemical42    | 10%                  | 500 liters      |
      | Chemical43    | 10%                  | 500 liters      |
      | Chemical44    | 10%                  | 500 liters      |
      | Chemical45    | 10%                  | 500 liters      |
      | Chemical46    | 10%                  | 500 liters      |
      | Chemical47    | 10%                  | 500 liters      |
      | Chemical48    | 10%                  | 500 liters      |
      | Chemical49    | 10%                  | 500 liters      |
      | Chemical50    | 10%                  | 500 liters      |
      | Chemical51    | 10%                  | 500 liters      |
      | Chemical52    | 10%                  | 500 liters      |
      | Chemical53    | 10%                  | 500 liters      |
      | Chemical54    | 10%                  | 500 liters      |
      | Chemical55    | 10%                  | 500 liters      |
      | Chemical56    | 10%                  | 500 liters      |
      | Chemical57    | 10%                  | 500 liters      |
      | Chemical58    | 10%                  | 500 liters      |
      | Chemical59    | 10%                  | 500 liters      |
      | Chemical60    | 10%                  | 500 liters      |
      | Chemical61    | 10%                  | 500 liters      |
      | Chemical62    | 10%                  | 500 liters      |
      | Chemical63    | 10%                  | 500 liters      |
      | Chemical64    | 10%                  | 500 liters      |
      | Chemical65    | 10%                  | 500 liters      |
      | Chemical66    | 10%                  | 500 liters      |
      | Chemical67    | 10%                  | 500 liters      |
      | Chemical68    | 10%                  | 500 liters      |
      | Chemical69    | 10%                  | 500 liters      |
      | Chemical70    | 10%                  | 500 liters      |
      | Chemical71    | 10%                  | 500 liters      |
      | Chemical72    | 10%                  | 500 liters      |
      | Chemical73    | 10%                  | 500 liters      |
      | Chemical74    | 10%                  | 500 liters      |
      | Chemical75    | 10%                  | 500 liters      |
      | Chemical76    | 10%                  | 500 liters      |
      | Chemical77    | 10%                  | 500 liters      |
      | Chemical78    | 10%                  | 500 liters      |
      | Chemical79    | 10%                  | 500 liters      |
      | Chemical80    | 10%                  | 500 liters      |
      | Chemical81    | 10%                  | 500 liters      |
      | Chemical82    | 10%                  | 500 liters      |
      | Chemical83    | 10%                  | 500 liters      |
      | Chemical84    | 10%                  | 500 liters      |
      | Chemical85    | 10%                  | 500 liters      |
      | Chemical86    | 10%                  | 500 liters      |
      | Chemical87    | 10%                  | 500 liters      |
      | Chemical88    | 10%                  | 500 liters      |
      | Chemical89    | 10%                  | 500 liters      |
      | Chemical90    | 10%                  | 500 liters      |
      | Chemical91    | 10%                  | 500 liters      |
      | Chemical92    | 10%                  | 500 liters      |
      | Chemical93    | 10%                  | 500 liters      |
      | Chemical94    | 10%                  | 500 liters      |
      | Chemical95    | 10%                  | 500 liters      |
      | Chemical96    | 10%                  | 500 liters      |
      | Chemical97    | 10%                  | 500 liters      |
      | Chemical98    | 10%                  | 500 liters      |
      | Chemical99    | 10%                  | 500 liters      |
      | Chemical100   | 10%                  | 500 liters      |

  @feature_user_login
  @concurrent_proppant_addition
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    Given User A navigates to the Proppant Setup screen
    And User B navigates to the Proppant Setup screen simultaneously
    When User A clicks on the "Add Proppant" button
    And User A selects "<proppant_name_a>" and enters "<total_design_volume_a>"
    And User A clicks on the "Save" button
    When User B clicks on the "Add Proppant" button
    And User B selects "<proppant_name_b>" and enters "<total_design_volume_b>"
    And User B clicks on the "Save" button
    Then User A's Proppant should be saved successfully
    And User B's Proppant should be saved successfully
    And no data conflicts should occur
    And both Proppants should appear in the list for their respective users

    Examples:
      | proppant_name_a | total_design_volume_a | proppant_name_b | total_design_volume_b |
      | Sand             | 1000                  | Ceramic         | 2000                  |

  @feature_user_login
  @large_values_test
  Scenario Outline: Chemical Setup with Large Numbers for Design Concentration and Volume
    Given the user clicks on the "Add Chemical" button
    When the user enters the chemical name "<chemical_name>"
    And the user enters a very large design concentration "<design_concentration>"
    And the user enters a very large designed volume "<designed_volume>"
    And the user clicks on the "Save" button
    And the user refreshes the Chemical Setup screen
    Then the chemical with large numbers should be displayed correctly

    Examples:
      | chemical_name     | design_concentration | designed_volume |
      | sodium chloride    | a * 1000000         | a * 1000000    |

  @feature_user_login
  @max_input_length
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    When the user clicks on the "Add Vendor" button
    And the user enters a maximum length email address "<email>"
    And the user enters a valid PO number "<PO_number>"
    And the user clicks the "Save" button
    Then the vendor should be added successfully
    And the user refreshes the Email Setup screen
    Then the vendor should appear in the list with correct details

    Examples:
      | email                                                                                                                                                      | PO_number                                                                                     |
      | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa |

  @feature_user_login
  @empty_proppant_name
  Scenario Outline: Validate Proppant Setup handles empty fields
    When the user clicks on the "Add Proppant" button
    And the user leaves the Proppant name field empty
    And the user enters a valid total design volume "<total_design_volume>"
    And the user clicks on the "Save" button
    Then an error message should be displayed for the Proppant name field

    Examples:
      | total_design_volume |
      | 1000                |

  @empty_total_design_volume
  Scenario Outline: Validate Proppant Setup handles missing total design volume
    When the user enters a valid Proppant name "<proppant_name>"
    And the user leaves the total design volume field empty
    And the user clicks on the "Save" button
    Then an error message should be displayed for the total design volume field

    Examples:
      | proppant_name       |
      | abcd proppant       |

  @feature_user_login
  @validate_proppant_entries
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    When I add a Proppant with valid details
    And I click on the "Save" button
    Then the Proppant entry should be saved successfully
    And I refresh the Proppant Setup screen
    Then all Proppant entries should be displayed correctly
    And I scroll through the list of Proppants
    Then the screen should respond without lag
    And there should be no errors during the process

    Examples:
      | company_name   | proposal_id | opportunity_name | sales_engineer_name | phone_number | date       | status     |
      | abcd pvt.ltd   | 231235      | ramu             | ramu                | 9876543210   | 12/5/2025  | contacted  |
      | abcd pvt.ltd   | 231236      | ramu             | ramu                | 9876543210   | 12/5/2025  | contacted  |
      | abcd pvt.ltd   | 231237      | ramu             | ramu                | 9876543210   | 12/5/2025  | contacted  |
      | abcd pvt.ltd   | 231238      | ramu             | ramu                | 9876543210   | 12/5/2025  | contacted  |

  @feature_user_login
  @special-character-chemical
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    When the user clicks on the "Add Chemical" button
    And the user enters a chemical name "<chemical_name>"
    And the user enters a valid design concentration "<design_concentration>"
    And the user enters a valid designed volume "<designed_volume>"
    And the user clicks on the "Save" button
    Then the chemical should be added successfully
    And the user refreshes the Chemical Setup screen
    Then the chemical should appear in the list

    Examples:
      | chemical_name | design_concentration | designed_volume |
      | Acid123      | 15%                  | 1000 liters     |

  @feature_user_login
  @validate_proppant_setup
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    Given the user clicks on the "Add Proppant" button
    When the user enters "<proppant_name>"
    And the user enters "<total_design_volume>"
    And the user clicks on the "Save" button
    And the user refreshes the Proppant Setup screen
    Then the Proppant with unusual combination "<proppant_name>" should be displayed correctly

    Examples:
      | proppant_name         | total_design_volume |
      | ProppantName1        | 1000                |
      | ProppantName2        | 2000                |

  @feature_email_setup
  @empty_fields
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    When I click on the "Add Vendor" button
    And I leave all fields empty
    And I click on the "Save" button
    Then the system does not crash
    And the user can navigate away without issues
    And no data is saved
    And the UI remains responsive

    Examples:
      | field name |
      |            |
      |            |
      |            |
      |            |

  @feature_user_login
  @max_delivery_records
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    When I click on the "Create Delivery Record" button
    And I select "<vendor>" from the vendor dropdown
    And I select "<PO>" from the PO dropdown
    And I select "<chemical_type>" from the chemical type dropdown
    And I enter a valid BOL number "<BOL_number>"
    And I enter a valid received quantity "<received_quantity>"
    And I click on the "Save" button
    Then all delivery records are added successfully without performance issues

    Examples:
      | vendor          | PO       | chemical_type | BOL_number | received_quantity |
      | abcd pvt.ltd   | PO12345  | Chemical A    | BOL12345   | 100 liters        |

  @feature_email_setup
  @validate_empty_fields
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    When the user clicks on the "Add Vendor" button
    And the user leaves the vendor type field empty
    And the user enters "<po_number>"
    And the user clicks on the "Save" button
    Then an error message is displayed for the vendor type field
    And the vendor is not saved due to the missing type

    When the user enters "<vendor_type>" for the vendor type field
    And the user leaves the PO number field empty
    And the user clicks on the "Save" button
    Then an error message is displayed for the PO number field
    And the vendor is not saved due to the missing PO number

    Examples:
      | vendor_type | po_number |
      |             | 123456    |

  @feature_user_login
  @large_volume_delivery
  Scenario Outline: Chemical, Proppant, Email & Delivery Setup for Job Stages
    When I click on the "Create Delivery Record" button
    And I select a vendor from the vendor dropdown
    And I select a PO from the PO dropdown
    And I select a chemical type from the chemical type dropdown
    And I enter a valid BOL number "<BOL_number>"
    And I enter a valid received quantity "<received_quantity>"
    Then all delivery records are added successfully without performance issues

    Examples:
      | BOL_number | received_quantity |
      | BOL12345   | 100 liters        |
      | BOL12346   | 200 liters        |
      | BOL12347   | 150 liters        |
      | BOL12348   | 250 liters        |
      | BOL12349   | 300 liters        |
