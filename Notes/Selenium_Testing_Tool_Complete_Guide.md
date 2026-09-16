# Selenium Testing Tool --- Complete Guide

## 1. What is Selenium?

**Selenium** is an open-source framework for automating web browsers. It
is mainly used for:

-   Functional testing
-   Regression testing
-   End-to-end (E2E) testing
-   Cross-browser testing
-   Web application automation
-   Repetitive browser tasks

Selenium can automate browsers such as Chrome, Edge, Firefox, and
Safari.

> Selenium is primarily a **web automation/testing tool**. It does not
> directly test desktop applications or native mobile applications.

------------------------------------------------------------------------

# 2. Selenium Components

Selenium is an ecosystem rather than a single program.

## 2.1 Selenium WebDriver

WebDriver is the main API used to control browsers programmatically.

Typical languages:

-   Java
-   Python
-   C#
-   JavaScript / Node.js
-   Ruby

Example architecture:

``` text
Your Test Code
      |
      v
Selenium WebDriver API
      |
      v
Browser Driver / WebDriver implementation
      |
      v
Chrome / Edge / Firefox / Safari
      |
      v
Web Application
```

Modern Selenium uses the WebDriver standard and Selenium Manager can
automatically manage many browser-driver requirements.

------------------------------------------------------------------------

## 2.2 Selenium IDE

**Selenium IDE** is a browser-based record-and-playback tool.

It is useful for:

-   Beginners
-   Quickly creating test cases
-   Recording browser actions
-   Learning Selenium concepts
-   Creating small regression tests
-   Exporting recorded tests into code

Typical workflow:

``` text
Open Selenium IDE
       |
       v
Create Project
       |
       v
Enter Base URL
       |
       v
Record actions
       |
       v
Save commands
       |
       v
Run Test
       |
       v
Inspect Pass/Fail results
```

Selenium IDE is different from WebDriver. IDE provides a graphical
interface, while WebDriver is normally used through programming code.

------------------------------------------------------------------------

## 2.3 Selenium Grid

Selenium Grid allows tests to execute across different environments.

For example:

``` text
                  Selenium Grid
                       |
          +------------+------------+
          |            |            |
       Chrome        Firefox       Edge
       Windows        Linux       Windows
```

This is useful for:

-   Parallel testing
-   Cross-browser testing
-   Cross-platform testing
-   Large test suites
-   CI/CD pipelines

------------------------------------------------------------------------

# 3. Selenium Testing Flow

A typical automated test follows this process:

``` text
Test Requirement
      |
      v
Test Case
      |
      v
Locate Web Element
      |
      v
Perform Action
      |
      v
Wait for Expected State
      |
      v
Validate Result
      |
      v
Pass / Fail
      |
      v
Generate Report
```

Example:

``` text
Open Login Page
      ↓
Find Username field
      ↓
Enter username
      ↓
Find Password field
      ↓
Enter password
      ↓
Click Login
      ↓
Wait for dashboard
      ↓
Verify dashboard title/text
      ↓
Test Passed
```

------------------------------------------------------------------------

# 4. How Selenium Actually Works

Suppose your Python code contains:

``` python
driver.get("https://example.com")
```

The logical flow is:

``` text
Python Test
    |
    | Selenium API
    v
WebDriver
    |
    | WebDriver protocol
    v
Browser
    |
    v
Website
```

When you execute:

``` python
driver.find_element(By.ID, "username")
```

Selenium asks the browser to locate the element whose HTML `id` is
`username`.

Then:

``` python
element.send_keys("Harshit")
```

causes Selenium to send keyboard input to that browser element.

------------------------------------------------------------------------

# 5. Selenium WebDriver Setup --- Python

## 5.1 Install Python

Install a supported Python version from the official Python
distribution.

Check:

``` bash
python --version
```

------------------------------------------------------------------------

## 5.2 Install Selenium

``` bash
pip install selenium
```

Verify:

``` bash
pip show selenium
```

------------------------------------------------------------------------

# 6. First Selenium Program

``` python
from selenium import webdriver

driver = webdriver.Chrome()

driver.get("https://example.com")

print(driver.title)

driver.quit()
```

### Explanation

``` python
from selenium import webdriver
```

Imports Selenium WebDriver.

``` python
driver = webdriver.Chrome()
```

Creates a Chrome browser session.

``` python
driver.get("https://example.com")
```

Opens the webpage.

``` python
driver.title
```

Reads the page title.

``` python
driver.quit()
```

Closes the browser session.

------------------------------------------------------------------------

# 7. Selenium Dashboard / Interface

There are two different things people commonly call the "Selenium
dashboard".

## 7.1 Selenium IDE Interface

Selenium IDE provides a graphical interface.

A typical layout contains:

``` text
+-------------------------------------------------------+
| Selenium IDE                         Project Controls |
+-------------------------------------------------------+
| Test Cases / Suites | Command / Target / Value        |
|                     |                                  |
| Login Test          | open       /login                |
| Search Test         | click      id=username           |
| Checkout Test       | type       id=password           |
|                     | click      id=login              |
|                     |                                  |
+---------------------+----------------------------------+
|                         Test Runner                   |
|                                                     |
|                         PASS / FAIL                  |
+-------------------------------------------------------+
```

The exact UI can change between Selenium IDE versions.

------------------------------------------------------------------------

# 8. Selenium IDE Main Areas

## 8.1 Project

A Selenium IDE project groups related tests.

Example:

``` text
E-Commerce Testing
│
├── Login Test
├── Product Search Test
├── Add To Cart Test
├── Checkout Test
└── Logout Test
```

------------------------------------------------------------------------

## 8.2 Test Suite

A suite groups multiple test cases.

Example:

``` text
Regression Suite
│
├── Login
├── Search
├── Cart
├── Payment
└── Logout
```

Running the suite executes the selected tests according to the suite
configuration.

------------------------------------------------------------------------

## 8.3 Test Case

A test case contains a sequence of commands.

Example:

``` text
Test: Login

1. open       /login
2. type       id=username       testuser
3. type       id=password       password123
4. click      id=login
5. assertText css=.welcome     Welcome
```

------------------------------------------------------------------------

# 9. Selenium IDE Commands

Common Selenium IDE commands include:

  Command                   Purpose
  ------------------------- ------------------------------------------
  `open`                    Navigate to a URL
  `click`                   Click an element
  `type`                    Enter text
  `sendKeys`                Send keyboard input
  `select`                  Select an option
  `check`                   Check a checkbox
  `uncheck`                 Uncheck a checkbox
  `assertText`              Verify text
  `assertTitle`             Verify page title
  `verifyText`              Verify text without immediately stopping
  `waitForElementPresent`   Wait for an element
  `pause`                   Pause execution
  `store`                   Store a value
  `executeScript`           Execute JavaScript

Command availability and syntax can vary by Selenium IDE version.

------------------------------------------------------------------------

# 10. Locators

Locators tell Selenium which element to interact with.

Consider:

``` html
<input id="username" name="user" type="text">
```

Possible locator:

``` text
id=username
```

Selenium Python:

``` python
driver.find_element(By.ID, "username")
```

------------------------------------------------------------------------

# 11. Types of Selenium Locators

## 11.1 ID

HTML:

``` html
<input id="email">
```

Python:

``` python
driver.find_element(By.ID, "email")
```

Usually one of the best choices when the ID is stable and unique.

------------------------------------------------------------------------

## 11.2 Name

HTML:

``` html
<input name="email">
```

Python:

``` python
driver.find_element(By.NAME, "email")
```

------------------------------------------------------------------------

## 11.3 Class Name

HTML:

``` html
<button class="login-button">
```

Python:

``` python
driver.find_element(By.CLASS_NAME, "login-button")
```

Be careful if the class is reused by many elements.

------------------------------------------------------------------------

## 11.4 CSS Selector

Example:

``` python
driver.find_element(By.CSS_SELECTOR, "#username")
```

Another:

``` python
driver.find_element(By.CSS_SELECTOR, "button.login-button")
```

CSS selectors are often compact and powerful.

------------------------------------------------------------------------

## 11.5 XPath

Example:

``` python
driver.find_element(By.XPATH, "//input[@id='username']")
```

Text-based XPath:

``` python
driver.find_element(By.XPATH, "//button[text()='Login']")
```

XPath is useful when CSS or simple locators are insufficient, but avoid
unnecessarily complicated XPath expressions.

------------------------------------------------------------------------

# 12. Finding Web Elements

Modern Selenium Python syntax:

``` python
from selenium.webdriver.common.by import By

username = driver.find_element(By.ID, "username")
```

Multiple elements:

``` python
elements = driver.find_elements(By.CSS_SELECTOR, ".product")
```

Difference:

``` text
find_element
      ↓
returns one element
      ↓
raises exception if not found

find_elements
      ↓
returns a list
      ↓
returns empty list if none found
```

------------------------------------------------------------------------

# 13. Browser Navigation

Open URL:

``` python
driver.get("https://example.com")
```

Back:

``` python
driver.back()
```

Forward:

``` python
driver.forward()
```

Refresh:

``` python
driver.refresh()
```

Current URL:

``` python
print(driver.current_url)
```

Page title:

``` python
print(driver.title)
```

------------------------------------------------------------------------

# 14. Browser Window Management

Maximize:

``` python
driver.maximize_window()
```

Set window size:

``` python
driver.set_window_size(1280, 720)
```

Fullscreen:

``` python
driver.fullscreen_window()
```

------------------------------------------------------------------------

# 15. Clicking Elements

``` python
button = driver.find_element(By.ID, "login")
button.click()
```

Or:

``` python
driver.find_element(By.ID, "login").click()
```

------------------------------------------------------------------------

# 16. Entering Text

``` python
username = driver.find_element(By.ID, "username")

username.clear()
username.send_keys("testuser")
```

Password:

``` python
driver.find_element(By.ID, "password").send_keys("password123")
```

------------------------------------------------------------------------

# 17. Keyboard Actions

``` python
from selenium.webdriver.common.keys import Keys

search = driver.find_element(By.NAME, "q")
search.send_keys("Selenium")
search.send_keys(Keys.ENTER)
```

Other keys:

``` python
Keys.TAB
Keys.ESCAPE
Keys.ARROW_DOWN
Keys.ARROW_UP
Keys.CONTROL
Keys.SHIFT
```

------------------------------------------------------------------------

# 18. Explicit Waits

One of the most important Selenium concepts is **waiting**.

Web applications are dynamic. An element may not exist immediately after
navigation.

Use explicit waits:

``` python
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

wait = WebDriverWait(driver, 10)

login_button = wait.until(
    EC.element_to_be_clickable((By.ID, "login"))
)

login_button.click()
```

This means:

``` text
Wait up to 10 seconds
       |
       v
Is login button clickable?
       |
   +---+---+
   |       |
  YES      NO
   |       |
 click   keep waiting
```

------------------------------------------------------------------------

# 19. Common Expected Conditions

``` python
EC.presence_of_element_located(...)
```

Element exists in DOM.

``` python
EC.visibility_of_element_located(...)
```

Element is visible.

``` python
EC.element_to_be_clickable(...)
```

Element is visible and enabled for clicking.

``` python
EC.url_contains("dashboard")
```

URL contains expected text.

``` python
EC.title_contains("Dashboard")
```

Page title contains expected text.

------------------------------------------------------------------------

# 20. Why Hard-Coded Sleep Is Usually Bad

Avoid:

``` python
import time

time.sleep(5)
```

This always waits five seconds.

Better:

``` python
wait.until(
    EC.visibility_of_element_located((By.ID, "dashboard"))
)
```

The explicit wait continues as soon as the condition is satisfied.

------------------------------------------------------------------------

# 21. Assertions

Assertions verify expected results.

Example:

``` python
assert "Dashboard" in driver.title
```

Or:

``` python
message = driver.find_element(By.ID, "message").text

assert message == "Login successful"
```

Testing concept:

``` text
Actual Result
     |
     v
Compare with
Expected Result
     |
  +--+--+
  |     |
Match  No match
  |     |
PASS   FAIL
```

------------------------------------------------------------------------

# 22. Complete Login Test

``` python
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

driver = webdriver.Chrome()

try:
    driver.get("https://example.com/login")

    wait = WebDriverWait(driver, 10)

    username = wait.until(
        EC.visibility_of_element_located((By.ID, "username"))
    )

    password = driver.find_element(By.ID, "password")

    username.send_keys("testuser")
    password.send_keys("password123")

    login_button = wait.until(
        EC.element_to_be_clickable((By.ID, "login"))
    )

    login_button.click()

    wait.until(
        EC.url_contains("dashboard")
    )

    assert "dashboard" in driver.current_url.lower()

    print("Test Passed")

finally:
    driver.quit()
```

------------------------------------------------------------------------

# 23. Handling Dropdowns

For a standard HTML `<select>`:

``` python
from selenium.webdriver.support.ui import Select

dropdown = Select(
    driver.find_element(By.ID, "country")
)

dropdown.select_by_visible_text("India")
```

Other methods:

``` python
dropdown.select_by_value("IN")
dropdown.select_by_index(1)
```

------------------------------------------------------------------------

# 24. Checkboxes

``` python
checkbox = driver.find_element(By.ID, "terms")

if not checkbox.is_selected():
    checkbox.click()
```

------------------------------------------------------------------------

# 25. Radio Buttons

``` python
radio = driver.find_element(By.ID, "male")

if not radio.is_selected():
    radio.click()
```

------------------------------------------------------------------------

# 26. Alerts

JavaScript alert:

``` python
alert = driver.switch_to.alert

print(alert.text)

alert.accept()
```

Dismiss:

``` python
alert.dismiss()
```

Enter text:

``` python
alert.send_keys("Hello")
```

------------------------------------------------------------------------

# 27. Frames / iFrames

If an element is inside an iframe:

``` python
frame = driver.find_element(By.ID, "payment-frame")

driver.switch_to.frame(frame)
```

Interact with elements inside it:

``` python
driver.find_element(By.ID, "card-number").send_keys("1234")
```

Return to the main page:

``` python
driver.switch_to.default_content()
```

------------------------------------------------------------------------

# 28. Multiple Windows / Tabs

Get all windows:

``` python
handles = driver.window_handles
```

Switch:

``` python
driver.switch_to.window(handles[1])
```

Example:

``` text
Main Window
     |
     +----> New Tab
              |
              v
       switch_to.window()
```

------------------------------------------------------------------------

# 29. Mouse Actions

Use `ActionChains` for advanced mouse interactions.

``` python
from selenium.webdriver.common.action_chains import ActionChains

element = driver.find_element(By.ID, "menu")

ActionChains(driver).move_to_element(element).perform()
```

Click and hold:

``` python
ActionChains(driver).click_and_hold(element).perform()
```

Drag and drop:

``` python
source = driver.find_element(By.ID, "source")
target = driver.find_element(By.ID, "target")

ActionChains(driver).drag_and_drop(source, target).perform()
```

------------------------------------------------------------------------

# 30. JavaScript Execution

Selenium can execute JavaScript in the page.

``` python
driver.execute_script(
    "arguments[0].click();",
    element
)
```

Get page scroll position:

``` python
driver.execute_script(
    "window.scrollTo(0, document.body.scrollHeight);"
)
```

JavaScript should generally be a fallback. Prefer normal Selenium
interactions when they work reliably.

------------------------------------------------------------------------

# 31. Screenshots

Take screenshot:

``` python
driver.save_screenshot("failure.png")
```

This is useful when a test fails.

A test framework can also capture screenshots automatically on failure.

------------------------------------------------------------------------

# 32. Headless Testing

Headless Chrome runs without displaying the browser UI.

``` python
from selenium import webdriver
from selenium.webdriver.chrome.options import Options

options = Options()
options.add_argument("--headless")

driver = webdriver.Chrome(options=options)
```

Useful for:

-   CI/CD
-   Servers
-   Automated regression suites
-   Faster execution in some environments

During development, normal browser mode is often easier for debugging.

------------------------------------------------------------------------

# 33. Selenium with Pytest

For real projects, Selenium is commonly combined with a test framework
such as `pytest`.

Install:

``` bash
pip install pytest selenium
```

Example:

``` python
from selenium import webdriver

def test_homepage():
    driver = webdriver.Chrome()

    try:
        driver.get("https://example.com")

        assert "Example" in driver.title

    finally:
        driver.quit()
```

Run:

``` bash
pytest
```

------------------------------------------------------------------------

# 34. Test Fixtures

A fixture can create and clean up the browser.

``` python
import pytest
from selenium import webdriver

@pytest.fixture
def driver():
    browser = webdriver.Chrome()

    yield browser

    browser.quit()
```

Test:

``` python
def test_homepage(driver):
    driver.get("https://example.com")

    assert "Example" in driver.title
```

This prevents repeating browser setup in every test.

------------------------------------------------------------------------

# 35. Page Object Model (POM)

For larger projects, avoid putting all Selenium commands directly inside
test cases.

Instead, use Page Objects.

Example:

``` text
automation/
│
├── tests/
│   ├── test_login.py
│   └── test_search.py
│
├── pages/
│   ├── login_page.py
│   └── home_page.py
│
├── conftest.py
└── requirements.txt
```

------------------------------------------------------------------------

# 36. Login Page Object

``` python
from selenium.webdriver.common.by import By

class LoginPage:

    USERNAME = (By.ID, "username")
    PASSWORD = (By.ID, "password")
    LOGIN_BUTTON = (By.ID, "login")

    def __init__(self, driver):
        self.driver = driver

    def login(self, username, password):
        self.driver.find_element(*self.USERNAME).send_keys(username)
        self.driver.find_element(*self.PASSWORD).send_keys(password)
        self.driver.find_element(*self.LOGIN_BUTTON).click()
```

Test:

``` python
def test_login(driver):
    driver.get("https://example.com/login")

    login_page = LoginPage(driver)

    login_page.login(
        "testuser",
        "password123"
    )
```

Advantages:

-   Easier maintenance
-   Reusable code
-   Cleaner tests
-   Locators are centralized
-   UI changes are easier to handle

------------------------------------------------------------------------

# 37. Recommended Automation Project Architecture

A production-style project can look like:

``` text
selenium-project/
│
├── tests/
│   ├── test_login.py
│   ├── test_search.py
│   └── test_checkout.py
│
├── pages/
│   ├── login_page.py
│   ├── home_page.py
│   └── checkout_page.py
│
├── utils/
│   ├── waits.py
│   ├── screenshots.py
│   └── config.py
│
├── test_data/
│   └── users.json
│
├── reports/
│
├── conftest.py
├── requirements.txt
└── README.md
```

------------------------------------------------------------------------

# 38. Data-Driven Testing

Instead of hard-coding one user:

``` python
username = "user1"
```

Use test data:

``` python
users = [
    ("user1", "pass1"),
    ("user2", "pass2"),
    ("user3", "pass3"),
]
```

Then execute the same test against multiple datasets.

This is useful for:

-   Login combinations
-   Search values
-   Form validation
-   Product data
-   Boundary testing

------------------------------------------------------------------------

# 39. Selenium Test Lifecycle

A good automated test usually follows:

``` text
SETUP
  |
  v
Open browser
  |
  v
Load test data
  |
  v
TEST
  |
  +--> Navigate
  |
  +--> Locate element
  |
  +--> Perform action
  |
  +--> Wait
  |
  +--> Validate
  |
  v
TEARDOWN
  |
  v
Screenshot if required
  |
  v
Close browser
  |
  v
Report result
```

------------------------------------------------------------------------

# 40. Selenium and CI/CD

Selenium tests can run automatically after code changes.

Example:

``` text
Developer pushes code
        |
        v
Git repository
        |
        v
CI/CD pipeline
        |
        v
Install dependencies
        |
        v
Start browser
        |
        v
Run Selenium tests
        |
        v
Generate report
        |
     +--+--+
     |     |
   PASS   FAIL
     |     |
 Deploy   Notify
```

Common CI/CD platforms include:

-   GitHub Actions
-   Jenkins
-   GitLab CI/CD
-   Azure DevOps
-   Other CI systems

------------------------------------------------------------------------

# 41. Cross-Browser Testing

A test can be executed against different browsers.

``` python
webdriver.Chrome()
webdriver.Firefox()
webdriver.Edge()
```

Conceptually:

``` text
             Same Test
                 |
       +---------+---------+
       |         |         |
     Chrome   Firefox     Edge
       |         |         |
       +---------+---------+
                 |
              Results
```

For large-scale testing, Selenium Grid can distribute tests across
browser/OS combinations.

------------------------------------------------------------------------

# 42. Selenium Grid

Grid allows remote browser execution.

Example:

``` text
                    Test Suite
                        |
                        v
                  Selenium Grid
                 /       |       \
                /        |        \
           Chrome      Firefox     Edge
           Windows      Linux     Windows
```

Benefits:

-   Parallel execution
-   Cross-browser testing
-   Remote execution
-   Faster regression testing

------------------------------------------------------------------------

# 43. Selenium Manager

Modern Selenium releases include Selenium Manager, which can help
discover and manage browser drivers automatically.

Therefore, a basic script such as:

``` python
driver = webdriver.Chrome()
```

often works without manually downloading a ChromeDriver executable.

For controlled enterprise environments, explicit driver/browser version
management may still be appropriate.

------------------------------------------------------------------------

# 44. Common Selenium Exceptions

## NoSuchElementException

The element could not be located.

Possible causes:

-   Wrong locator
-   Element not loaded
-   Wrong page
-   Element inside iframe
-   Dynamic DOM

------------------------------------------------------------------------

## TimeoutException

An explicit wait reached its timeout.

Example:

``` python
wait.until(...)
```

did not satisfy its condition within the configured time.

------------------------------------------------------------------------

## StaleElementReferenceException

The element reference is no longer attached to the current DOM.

Common solution:

-   Locate the element again
-   Wait for the page state to stabilize
-   Avoid storing element references longer than necessary

------------------------------------------------------------------------

## ElementClickInterceptedException

Another element is blocking the click.

Possible causes:

-   Popup
-   Overlay
-   Animation
-   Incorrect timing
-   Element not in the expected state

------------------------------------------------------------------------

## ElementNotInteractableException

The element exists but cannot currently be interacted with.

------------------------------------------------------------------------

# 45. Debugging Selenium Tests

When a test fails:

## Step 1 --- Read the exception

Example:

``` text
NoSuchElementException
```

Ask:

``` text
Was the locator correct?
```

## Step 2 --- Inspect the browser

Use browser developer tools:

``` text
Right click
    ↓
Inspect
    ↓
Elements
```

Find:

-   ID
-   name
-   class
-   attributes
-   DOM hierarchy

## Step 3 --- Check timing

Try an explicit wait.

## Step 4 --- Check iframe

If the element is inside an iframe:

``` python
driver.switch_to.frame(...)
```

## Step 5 --- Take screenshot

``` python
driver.save_screenshot("debug.png")
```

------------------------------------------------------------------------

# 46. Good Locator Strategy

Prefer stable locators.

Recommended general order:

``` text
Unique ID
   ↓
Stable data-* attribute
   ↓
Stable CSS selector
   ↓
Name
   ↓
Relative XPath
   ↓
Complex XPath
```

Example:

``` html
<button data-testid="login-button">
    Login
</button>
```

Good locator:

``` python
(By.CSS_SELECTOR, "[data-testid='login-button']")
```

Avoid selectors based on fragile generated class names such as:

``` text
.css-1a2b3c
```

if those classes change between builds.

------------------------------------------------------------------------

# 47. What Selenium Should NOT Be Used For

Selenium is not the best tool for every testing requirement.

It is primarily designed for web browsers.

For example:

``` text
Web UI testing        → Selenium
API testing           → API-focused tools
Unit testing          → Unit-test framework
Native mobile apps    → Mobile automation tools
Performance testing   → Performance-testing tools
```

Selenium can be one part of a larger testing strategy.

------------------------------------------------------------------------

# 48. Selenium IDE vs WebDriver

  Feature                Selenium IDE                 Selenium WebDriver
  ---------------------- ---------------------------- -------------------------
  GUI                    Yes                          No
  Programming required   Low                          Yes
  Record actions         Yes                          Usually code-based
  Complex logic          Limited compared with code   Excellent
  Large framework        Less suitable                Very suitable
  CI/CD                  Possible                     Excellent
  Page Object Model      Limited                      Excellent
  Learning curve         Low                          Higher
  Best use               Quick tests/prototyping      Professional automation

------------------------------------------------------------------------

# 49. Selenium IDE Practical Workflow

## Step 1

Install/open Selenium IDE.

## Step 2

Create a new project.

Example:

``` text
Project: E-Commerce Testing
```

## Step 3

Enter the application's base URL.

Example:

``` text
https://example.com
```

## Step 4

Create a test.

``` text
Login Test
```

## Step 5

Start recording.

## Step 6

Perform actions in the browser:

``` text
Open login page
       ↓
Enter username
       ↓
Enter password
       ↓
Click Login
       ↓
Open dashboard
```

## Step 7

Stop recording.

Selenium IDE creates commands corresponding to the actions.

## Step 8

Add assertions.

For example:

``` text
assertTitle
assertText
verifyText
```

## Step 9

Run the test.

## Step 10

Inspect the result.

``` text
PASS
or
FAIL
```

------------------------------------------------------------------------

# 50. Example Selenium IDE Test

Conceptual command table:

  Command                   Target           Value
  ------------------------- ---------------- -------------
  `open`                    `/login`         
  `type`                    `id=username`    testuser
  `type`                    `id=password`    password123
  `click`                   `id=login`       
  `waitForElementPresent`   `id=dashboard`   
  `assertText`              `id=welcome`     Welcome

The exact command names available can depend on the Selenium IDE
release.

------------------------------------------------------------------------

# 51. Test Case Design

A good test case should contain:

``` text
Test ID
Test Name
Preconditions
Test Data
Steps
Expected Result
Actual Result
Status
```

Example:

``` text
Test ID:
LOGIN-001

Test Name:
Valid Login

Precondition:
User account exists

Test Data:
Username = testuser
Password = valid password

Steps:
1. Open login page
2. Enter username
3. Enter password
4. Click Login

Expected Result:
Dashboard is displayed

Status:
PASS
```

------------------------------------------------------------------------

# 52. Positive and Negative Testing

## Positive Test

Valid credentials:

``` text
Username: valid_user
Password: valid_password
Expected: Login succeeds
```

## Negative Test

Invalid password:

``` text
Username: valid_user
Password: wrong_password
Expected: Error message
```

Other negative cases:

-   Empty username
-   Empty password
-   Invalid email
-   Expired account
-   Locked account
-   Incorrect OTP
-   Invalid form values

------------------------------------------------------------------------

# 53. Regression Testing

Regression testing verifies that existing functionality still works
after changes.

Example:

``` text
Developer changes Login
        |
        v
Run Login tests
        |
        v
Run Cart tests
        |
        v
Run Checkout tests
        |
        v
Run Logout tests
        |
        v
Regression Result
```

Automation is especially valuable for regression suites because the same
tests can be executed repeatedly.

------------------------------------------------------------------------

# 54. Smoke Testing

Smoke tests are a small set of critical tests.

Example:

``` text
Open application
      ↓
Login
      ↓
Open dashboard
      ↓
Search product
      ↓
Add product to cart
```

If these basic workflows fail, a full regression run may not be useful.

------------------------------------------------------------------------

# 55. End-to-End Testing

E2E testing validates a complete business workflow.

Example e-commerce flow:

``` text
Login
  ↓
Search Product
  ↓
Open Product
  ↓
Add To Cart
  ↓
Checkout
  ↓
Enter Address
  ↓
Select Payment
  ↓
Place Order
  ↓
Verify Order Confirmation
```

This is a strong use case for Selenium.

------------------------------------------------------------------------

# 56. Best Practices

## 56.1 Use Explicit Waits

Prefer:

``` python
WebDriverWait(...)
```

over arbitrary long sleeps.

## 56.2 Keep Tests Independent

A test should ideally be able to run without depending on another test.

## 56.3 Use Page Objects

Keep page interaction logic separate from test logic.

## 56.4 Use Stable Locators

Avoid fragile selectors.

## 56.5 Keep Test Data Separate

Store data outside the test code where practical.

## 56.6 Capture Evidence on Failure

Screenshots, logs, and browser information help debugging.

## 56.7 Clean Up

Always close the browser:

``` python
finally:
    driver.quit()
```

## 56.8 Avoid Over-Automation

Automate stable, repetitive, high-value workflows rather than every
possible UI interaction.

------------------------------------------------------------------------

# 57. Recommended Learning Path

If you are starting from zero:

``` text
1. HTML basics
       ↓
2. CSS selectors
       ↓
3. XPath basics
       ↓
4. Selenium IDE
       ↓
5. Selenium WebDriver
       ↓
6. Locators
       ↓
7. Waits
       ↓
8. Assertions
       ↓
9. Alerts / Frames / Windows
       ↓
10. Pytest / JUnit
       ↓
11. Page Object Model
       ↓
12. Data-driven testing
       ↓
13. Reporting
       ↓
14. Selenium Grid
       ↓
15. CI/CD
```

------------------------------------------------------------------------

# 58. Complete Professional Workflow

A mature Selenium automation project generally looks like:

``` text
                    REQUIREMENT
                         |
                         v
                    TEST DESIGN
                         |
                         v
                  AUTOMATION CODE
                         |
                         v
                 PAGE OBJECT MODEL
                         |
                         v
                  TEST EXECUTION
                         |
          +--------------+--------------+
          |                             |
      Local Browser                 Selenium Grid
          |                             |
          +--------------+--------------+
                         |
                         v
                    TEST RESULTS
                         |
               +---------+---------+
               |                   |
             PASS                 FAIL
               |                   |
               |              Screenshot
               |              Logs
               |              Debugging
               |                   |
               +---------+---------+
                         |
                         v
                      REPORT
                         |
                         v
                       CI/CD
                         |
                         v
                      RELEASE
```

------------------------------------------------------------------------

# 59. Example End-to-End Project

A simple professional project might contain:

``` text
selenium-automation/
│
├── tests/
│   └── test_login.py
│
├── pages/
│   └── login_page.py
│
├── utils/
│   └── helpers.py
│
├── screenshots/
│
├── reports/
│
├── conftest.py
│
├── requirements.txt
│
└── README.md
```

`requirements.txt` could contain:

``` text
selenium
pytest
```

Run:

``` bash
pip install -r requirements.txt
```

Then:

``` bash
pytest
```

------------------------------------------------------------------------

# 60. Final Mental Model

Remember Selenium using this simple model:

``` text
                 SELENIUM
                    |
        +-----------+-----------+
        |           |           |
     Selenium    WebDriver   Selenium
       IDE                    Grid
        |           |           |
     GUI Test    Code Test   Distributed
                              Testing

                     |
                     v
                  Browser
                     |
                     v
               Web Application
```

The most important concepts to master are:

1.  **WebDriver**
2.  **Locators**
3.  **Element interactions**
4.  **Explicit waits**
5.  **Assertions**
6.  **Frames**
7.  **Alerts**
8.  **Multiple windows/tabs**
9.  **Page Object Model**
10. **Pytest/JUnit**
11. **Reporting**
12. **Selenium Grid**
13. **CI/CD**

------------------------------------------------------------------------

# 61. Quick Cheat Sheet

``` python
# Start
driver = webdriver.Chrome()

# Open
driver.get("https://example.com")

# Find
element = driver.find_element(By.ID, "username")

# Type
element.send_keys("hello")

# Click
element.click()

# Text
print(element.text)

# URL
print(driver.current_url)

# Title
print(driver.title)

# Back
driver.back()

# Refresh
driver.refresh()

# Screenshot
driver.save_screenshot("screen.png")

# JavaScript
driver.execute_script("window.scrollTo(0, 0);")

# Close current window
driver.close()

# End entire browser session
driver.quit()
```

------------------------------------------------------------------------

# 62. Important Note

Selenium is best understood as a **browser automation layer** rather
than a complete standalone test-management platform.

A professional setup often combines:

``` text
Selenium
   +
Python / Java / C#
   +
Pytest / JUnit
   +
Page Object Model
   +
Test Data
   +
Reports
   +
Selenium Grid
   +
CI/CD
```

Together, these components form a scalable web automation framework.
