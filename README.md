# New Orleans Saints Fan Persona Analysis ⚜️

## Project Overview
This is an end-to-end data analytics project exploring the demographic and behavioral drivers of New Orleans Saints fans. The primary goals of this analysis were to:
1. **Define the Fan Persona:** Analyze how factors like income, neighborhood density, and family structure impact overall fan passion.
2. **Address the Ecological Fallacy:** Differentiate between neighborhood Census median characteristics and individual fan traits to uncover the true financial standing of the fanbase.

## Repository Structure
Here is how the files are organized in this repository:
* **`data/`**
    * Contains the proprietary fan survey data and the live U.S. Census data pulled via API.
* **`scripts/`**
    * Contains the data engineering and cleaning scripts used to join and prepare the datasets.
* **`saints_fan_persona.qmd`**: The main Quarto file containing the exploratory data analysis (EDA), visualizations, and linear regression modeling.
* **`saints_fan_persona.html`**: The final rendered interactive report containing all charts, statistical outputs, and the executive conclusion.
* **`saints_persona_analysis.Rproj`**: The RStudio project file to ensure reproducible relative file paths.

## Tools & Libraries Used
This project was built entirely in **R** using **RStudio** and **Quarto**.
* **Data Acquisition & Manipulation:** `tidycensus` (API integration), `dplyr`.
* **Visualization:** `ggplot2`, `gt` (table formatting).
* **Statistical Modeling:** `car` (for checking Multicollinearity/VIF), `stats` (Multivariate Linear Regression).

## Key Findings
Through Multivariate Linear Regression and categorical outlier analysis, the following key insights were discovered:

**Insights:**
* **The Financial Outlier Phenomenon:** By comparing individual responses to Census data, I resolved the "Ecological Fallacy" to discover that 69% of fans significantly out-earn their neighborhood median. 
* **Lucrative Target Audience:** Saints fans possess premium purchasing power but are culturally anchored to working-class and middle-class neighborhoods, meaning they respond best to authentic, "everyday" brand messaging rather than luxury exclusivity.
* **Behavior over Demographics:** When controlling for all variables, in-stadium attendance and Season Ticket Holder status remained the most dominant, statistically significant drivers of elite fan affinity, far outweighing traditional life-stage metrics like having children.

## How to View
To view the fully formatted interactive report and visualizations, download the **[saints_fan_persona.html](saints_fan_persona.html)** file and open it in any web browser, or clone this repository and render the `saints_fan_persona.qmd` file in RStudio.
