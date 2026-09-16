# Selenium Cheat Sheet --- Python

## 1. Installation

``` bash
pip install selenium
```

Check installation:

``` bash
pip show selenium
```

------------------------------------------------------------------------

# 2. Basic Setup

``` python
from selenium import webdriver

driver = webdriver.Chrome()

driver.get("https://example.com")

print(driver.title)

driver.quit()
```

### Browser setup

``` python
driver = webdriver.Chrome()
driver = webdriver.Firefox()
driver = webdriver.Edge()
```

------------------------------------------------------------------------

# 3. Browser Commands

``` python
driver.get("https://example.com")
```

Open URL.

``` python
driver.back()
```

Go back.

``` python
driver.forward()
```

Go forward.

``` python
driver.refresh()
```

Refresh page.

``` python
driver.close()
```

Close current tab/window.

``` python
driver.quit()
```

Close entire browser session.

### Get information

``` python
driver.title
driver.current_url
driver.page_source
```

------------------------------------------------------------------------

# 4. Window Commands

``` python
driver.maximize_window()
driver.minimize_window()
driver.fullscreen_window()
```

Set size:

``` python
driver.set_window_size(1280, 720)
```

------------------------------------------------------------------------

# 5. Locators ⭐

Import:

``` python
from selenium.webdriver.common.by import By
```

## ID

HTML:

``` html
<input id="username">
```

Python:

``` python
driver.find_element(By.ID, "username")
```

## Name

``` python
driver.find_element(By.NAME, "username")
```

## Class Name

``` python
driver.find_element(By.CLASS_NAME, "login-btn")
```

## Tag Name

``` python
driver.find_element(By.TAG_NAME, "input")
```

## Link Text

``` python
driver.find_element(By.LINK_TEXT, "Login")
```

## Partial Link Text

``` python
driver.find_element(By.PARTIAL_LINK_TEXT, "Log")
```

## CSS Selector

``` python
driver.find_element(By.CSS_SELECTOR, "#username")
```

Examples:

``` python
driver.find_element(By.CSS_SELECTOR, ".login-btn")

driver.find_element(
    By.CSS_SELECTOR,
    "input[name='username']"
)

driver.find_element(
    By.CSS_SELECTOR,
    "button.login"
)
```

## XPath

``` python
driver.find_element(
    By.XPATH,
    "//input[@id='username']"
)
```

Text-based XPath:

``` python
driver.find_element(
    By.XPATH,
    "//button[text()='Login']"
)
```

Contains:

``` python
driver.find_element(
    By.XPATH,
    "//button[contains(text(),'Login')]"
)
```

Multiple attributes:

``` python
driver.find_element(
    By.XPATH,
    "//input[@type='text' and @name='username']"
)
```

------------------------------------------------------------------------

# 6. Find One vs Multiple Elements

### One element

``` python
element = driver.find_element(
    By.ID,
    "username"
)
```

Returns one element.

If not found → exception.

### Multiple elements

``` python
elements = driver.find_elements(
    By.CLASS_NAME,
    "product"
)
```

Returns a list.

If nothing is found → empty list.

Example:

``` python
products = driver.find_elements(
    By.CSS_SELECTOR,
    ".product"
)

for product in products:
    print(product.text)
```

------------------------------------------------------------------------

# 7. WebElement Commands

``` python
element.click()
```

Click.

``` python
element.send_keys("Hello")
```

Type.

``` python
element.clear()
```

Clear text.

``` python
element.text
```

Get visible text.

``` python
element.get_attribute("value")
```

Get attribute.

``` python
element.is_displayed()
```

Check visibility.

``` python
element.is_enabled()
```

Check enabled/disabled.

``` python
element.is_selected()
```

Check checkbox/radio selection.

------------------------------------------------------------------------

# 8. Input Example

HTML:

``` html
<input id="username">
```

Selenium:

``` python
username = driver.find_element(
    By.ID,
    "username"
)

username.clear()
username.send_keys("Harshit")
```

------------------------------------------------------------------------

# 9. Click Example

``` python
login = driver.find_element(
    By.ID,
    "login"
)

login.click()
```

------------------------------------------------------------------------

# 10. Keyboard Keys

``` python
from selenium.webdriver.common.keys import Keys
```

Examples:

``` python
element.send_keys(Keys.ENTER)
element.send_keys(Keys.TAB)
element.send_keys(Keys.ESCAPE)
element.send_keys(Keys.ARROW_DOWN)
element.send_keys(Keys.ARROW_UP)
element.send_keys(Keys.BACKSPACE)
element.send_keys(Keys.DELETE)
```

Example:

``` python
search = driver.find_element(By.NAME, "q")

search.send_keys("Selenium")
search.send_keys(Keys.ENTER)
```

------------------------------------------------------------------------

# 11. Explicit Waits ⭐⭐⭐

One of the most important Selenium concepts.

``` python
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
```

Create wait:

``` python
wait = WebDriverWait(driver, 10)
```

Wait for element:

``` python
element = wait.until(
    EC.presence_of_element_located(
        (By.ID, "username")
    )
)
```

Wait until visible:

``` python
element = wait.until(
    EC.visibility_of_element_located(
        (By.ID, "username")
    )
)
```

Wait until clickable:

``` python
button = wait.until(
    EC.element_to_be_clickable(
        (By.ID, "login")
    )
)
```

------------------------------------------------------------------------

# 12. Common Expected Conditions

``` python
EC.presence_of_element_located()

EC.visibility_of_element_located()

EC.element_to_be_clickable()

EC.invisibility_of_element_located()

EC.text_to_be_present_in_element()

EC.title_contains()

EC.url_contains()

EC.alert_is_present()

EC.frame_to_be_available_and_switch_to_it()
```

------------------------------------------------------------------------

# 13. Avoid Excessive `sleep()`

Avoid:

``` python
import time

time.sleep(5)
```

Prefer:

``` python
wait.until(
    EC.element_to_be_clickable(
        (By.ID, "login")
    )
)
```

Why?

``` text
sleep(5)
    ↓
Always waits 5 seconds

WebDriverWait
    ↓
Waits until condition is satisfied
```

------------------------------------------------------------------------

# 14. Dropdowns ⭐

For a normal HTML `<select>`:

``` python
from selenium.webdriver.support.ui import Select
```

``` python
dropdown = Select(
    driver.find_element(By.ID, "country")
)
```

Select by visible text:

``` python
dropdown.select_by_visible_text("India")
```

By value:

``` python
dropdown.select_by_value("IN")
```

By index:

``` python
dropdown.select_by_index(1)
```

Get options:

``` python
options = dropdown.options

for option in options:
    print(option.text)
```

------------------------------------------------------------------------

# 15. Checkbox

``` python
checkbox = driver.find_element(
    By.ID,
    "terms"
)

if not checkbox.is_selected():
    checkbox.click()
```

------------------------------------------------------------------------

# 16. Radio Button

``` python
radio = driver.find_element(
    By.ID,
    "male"
)

if not radio.is_selected():
    radio.click()
```

------------------------------------------------------------------------

# 17. Alerts ⭐

Switch to alert:

``` python
alert = driver.switch_to.alert
```

Get text:

``` python
print(alert.text)
```

Accept:

``` python
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

Wait for alert:

``` python
wait.until(EC.alert_is_present())
```

------------------------------------------------------------------------

# 18. Frames / iFrames ⭐

Switch to iframe:

``` python
frame = driver.find_element(
    By.ID,
    "payment-frame"
)

driver.switch_to.frame(frame)
```

Interact with elements inside it:

``` python
driver.find_element(
    By.ID,
    "card"
).send_keys("1234")
```

Return to main document:

``` python
driver.switch_to.default_content()
```

Go to parent frame:

``` python
driver.switch_to.parent_frame()
```

------------------------------------------------------------------------

# 19. Windows / Tabs ⭐

Get current window:

``` python
driver.current_window_handle
```

Get all windows:

``` python
driver.window_handles
```

Switch window:

``` python
driver.switch_to.window(
    driver.window_handles[1]
)
```

Typical flow:

``` python
main_window = driver.current_window_handle

driver.find_element(By.ID, "new-tab").click()

for window in driver.window_handles:
    if window != main_window:
        driver.switch_to.window(window)
        break
```

------------------------------------------------------------------------

# 20. Mouse Actions

``` python
from selenium.webdriver.common.action_chains import ActionChains
```

Move mouse:

``` python
ActionChains(driver)\
    .move_to_element(element)\
    .perform()
```

Double click:

``` python
ActionChains(driver)\
    .double_click(element)\
    .perform()
```

Right click:

``` python
ActionChains(driver)\
    .context_click(element)\
    .perform()
```

Drag and drop:

``` python
ActionChains(driver)\
    .drag_and_drop(source, target)\
    .perform()
```

------------------------------------------------------------------------

# 21. Scrolling

Scroll down:

``` python
driver.execute_script(
    "window.scrollTo(0, document.body.scrollHeight);"
)
```

Scroll to element:

``` python
driver.execute_script(
    "arguments[0].scrollIntoView();",
    element
)
```

Scroll by amount:

``` python
driver.execute_script(
    "window.scrollBy(0, 500);"
)
```

------------------------------------------------------------------------

# 22. JavaScript

Execute JavaScript:

``` python
driver.execute_script(
    "alert('Hello');"
)
```

Click using JavaScript:

``` python
driver.execute_script(
    "arguments[0].click();",
    element
)
```

Get page height:

``` python
height = driver.execute_script(
    "return document.body.scrollHeight;"
)
```

Use JavaScript as a fallback, not the default interaction method.

------------------------------------------------------------------------

# 23. Screenshots ⭐

Full screenshot:

``` python
driver.save_screenshot("screen.png")
```

Element screenshot:

``` python
element.screenshot("element.png")
```

Useful when debugging failures.

------------------------------------------------------------------------

# 24. Page Source

``` python
html = driver.page_source

print(html)
```

------------------------------------------------------------------------

# 25. Assertions

Simple Python assertion:

``` python
assert "Dashboard" in driver.title
```

Text:

``` python
message = driver.find_element(
    By.ID,
    "message"
)

assert message.text == "Login successful"
```

URL:

``` python
assert "dashboard" in driver.current_url
```

------------------------------------------------------------------------

# 26. Headless Browser

``` python
from selenium import webdriver
from selenium.webdriver.chrome.options import Options

options = Options()

options.add_argument("--headless")

driver = webdriver.Chrome(
    options=options
)
```

Useful for CI/CD.

------------------------------------------------------------------------

# 27. Browser Options

``` python
from selenium.webdriver.chrome.options import Options

options = Options()

options.add_argument("--start-maximized")

driver = webdriver.Chrome(
    options=options
)
```

Other examples:

``` python
options.add_argument("--headless")
options.add_argument("--incognito")
```

------------------------------------------------------------------------

# 28. Pytest

Install:

``` bash
pip install pytest
```

Test:

``` python
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

Verbose:

``` bash
pytest -v
```

Run specific file:

``` bash
pytest test_login.py
```

------------------------------------------------------------------------

# 29. Pytest Fixture ⭐

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
def test_login(driver):

    driver.get(
        "https://example.com/login"
    )

    assert "Login" in driver.title
```

------------------------------------------------------------------------

# 30. Page Object Model ⭐⭐⭐

Recommended structure:

``` text
project/
│
├── tests/
│   ├── test_login.py
│   └── test_search.py
│
├── pages/
│   ├── login_page.py
│   └── home_page.py
│
├── utils/
│
├── screenshots/
│
├── reports/
│
└── conftest.py
```

Page:

``` python
from selenium.webdriver.common.by import By

class LoginPage:

    USERNAME = (
        By.ID,
        "username"
    )

    PASSWORD = (
        By.ID,
        "password"
    )

    LOGIN = (
        By.ID,
        "login"
    )

    def __init__(self, driver):
        self.driver = driver

    def login(self, username, password):

        self.driver.find_element(
            *self.USERNAME
        ).send_keys(username)

        self.driver.find_element(
            *self.PASSWORD
        ).send_keys(password)

        self.driver.find_element(
            *self.LOGIN
        ).click()
```

Test:

``` python
def test_login(driver):

    driver.get(
        "https://example.com/login"
    )

    login_page = LoginPage(driver)

    login_page.login(
        "testuser",
        "password123"
    )
```

------------------------------------------------------------------------

# 31. Selenium Exceptions

### Element not found

``` text
NoSuchElementException
```

Check:

``` text
Locator
Page
Timing
Iframe
```

### Timeout

``` text
TimeoutException
```

Check your explicit wait and expected condition.

### Stale Element

``` text
StaleElementReferenceException
```

The DOM changed after you located the element.

### Click blocked

``` text
ElementClickInterceptedException
```

Another element may be covering the target.

### Cannot interact

``` text
ElementNotInteractableException
```

The element exists but is not currently interactable.

------------------------------------------------------------------------

# 32. Useful Debugging

Check element:

``` python
element.is_displayed()
element.is_enabled()
element.is_selected()
```

Get HTML attribute:

``` python
element.get_attribute("class")
```

Get value:

``` python
element.get_attribute("value")
```

Get text:

``` python
element.text
```

Screenshot:

``` python
driver.save_screenshot("debug.png")
```

------------------------------------------------------------------------

# 33. Locator Cheat Sheet

Given:

``` html
<input
    id="username"
    name="user"
    class="form-control"
    type="text">
```

### ID

``` python
(By.ID, "username")
```

### Name

``` python
(By.NAME, "user")
```

### Class

``` python
(By.CLASS_NAME, "form-control")
```

### CSS

``` python
(By.CSS_SELECTOR, "#username")
```

``` python
(By.CSS_SELECTOR, "input[name='user']")
```

### XPath

``` python
(By.XPATH, "//input[@id='username']")
```

------------------------------------------------------------------------

# 34. XPath Cheat Sheet

Basic:

``` xpath
//input
```

By ID:

``` xpath
//input[@id='username']
```

By class:

``` xpath
//button[@class='login']
```

Multiple attributes:

``` xpath
//input[@type='text' and @name='username']
```

Text:

``` xpath
//button[text()='Login']
```

Contains:

``` xpath
//button[contains(text(),'Login')]
```

Contains attribute:

``` xpath
//input[contains(@class,'form')]
```

Parent:

``` xpath
//input[@id='username']/..
```

Following:

``` xpath
//input[@id='username']/following-sibling::button
```

------------------------------------------------------------------------

# 35. CSS Selector Cheat Sheet

ID:

``` css
#username
```

Class:

``` css
.login
```

Tag:

``` css
input
```

Attribute:

``` css
input[name="username"]
```

Multiple:

``` css
input[type="text"][name="username"]
```

Child:

``` css
form > input
```

Descendant:

``` css
form input
```

First child:

``` css
ul li:first-child
```

Nth child:

``` css
ul li:nth-child(2)
```

------------------------------------------------------------------------

# 36. Common Selenium Workflow

``` text
START
  ↓
Create WebDriver
  ↓
Open URL
  ↓
Find Element
  ↓
Wait
  ↓
Perform Action
  ↓
Validate Result
  ↓
Screenshot / Report
  ↓
Close Browser
  ↓
END
```

------------------------------------------------------------------------

# 37. Typical Login Automation

``` python
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

driver = webdriver.Chrome()

try:

    driver.get(
        "https://example.com/login"
    )

    wait = WebDriverWait(driver, 10)

    username = wait.until(
        EC.visibility_of_element_located(
            (By.ID, "username")
        )
    )

    password = driver.find_element(
        By.ID,
        "password"
    )

    username.send_keys("testuser")
    password.send_keys("password123")

    login = wait.until(
        EC.element_to_be_clickable(
            (By.ID, "login")
        )
    )

    login.click()

    wait.until(
        EC.url_contains("dashboard")
    )

    assert "dashboard" in driver.current_url

finally:

    driver.quit()
```

------------------------------------------------------------------------

# 38. Selenium Architecture

``` text
       TEST CODE
           |
           v
    Selenium WebDriver
           |
           v
     WebDriver Protocol
           |
           v
        Browser
           |
           v
    Web Application
```

For distributed execution:

``` text
              Test Code
                  |
                  v
           Selenium Grid
          /      |       \
         v       v        v
      Chrome  Firefox    Edge
```

------------------------------------------------------------------------

# 39. Selenium Components

``` text
Selenium
│
├── WebDriver
│     └── Programmatic browser automation
│
├── Selenium IDE
│     └── Record/playback GUI
│
└── Selenium Grid
      └── Remote/parallel browser execution
```

------------------------------------------------------------------------

# 40. Most Important Concepts

## Beginner

``` text
webdriver
get()
find_element()
click()
send_keys()
```

## Intermediate

``` text
By.ID
By.CSS_SELECTOR
By.XPATH
WebDriverWait
expected_conditions
assert
```

## Advanced

``` text
Page Object Model
Pytest
Fixtures
Data-driven testing
Screenshots
Parallel testing
Selenium Grid
CI/CD
```

------------------------------------------------------------------------

# 41. Golden Rules ⭐⭐⭐

``` text
1. Use stable locators.
2. Prefer explicit waits.
3. Don't depend heavily on sleep().
4. Keep tests independent.
5. Use Page Object Model for larger projects.
6. Keep test data separate.
7. Capture screenshots when tests fail.
8. Always quit the driver.
9. Don't use JavaScript when normal Selenium interaction works.
10. Keep automated tests focused on stable, valuable workflows.
```

------------------------------------------------------------------------

# 42. One-Minute Revision

``` python
# Import
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

# Browser
driver = webdriver.Chrome()

# URL
driver.get("https://example.com")

# Locate
element = driver.find_element(
    By.ID,
    "username"
)

# Type
element.send_keys("Harshit")

# Click
driver.find_element(
    By.ID,
    "login"
).click()

# Wait
wait = WebDriverWait(driver, 10)

wait.until(
    EC.visibility_of_element_located(
        (By.ID, "dashboard")
    )
)

# Assert
assert "Dashboard" in driver.title

# Screenshot
driver.save_screenshot("result.png")

# Quit
driver.quit()
```

------------------------------------------------------------------------

# 43. Remember This Formula

``` text
SELENIUM AUTOMATION

Browser
   +
Locator
   +
Wait
   +
Action
   +
Assertion
   +
Cleanup
   =
Automated Test
```

For professional automation:

``` text
Selenium
   +
Pytest
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
   =
Scalable Automation Framework
```
