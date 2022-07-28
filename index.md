## Support Our Science

This is the repository for the data and code used by [Support Our Science](www.supportourscience.ca), a movement to increase graduate student and postdoctoral funding in Canada.

-----------------------------

### Data

#### Graduate Student Cost of Living

`rent_cities.csv`
* Remaining income once tuition and rent are deducted from CGS-M ($17,500/yr) and PGS-D ($21,000/yr) award amounts. 
    * Rent is 12 months of the average rent for a 1-bedroom apartment in each city as of July 21, 2022 [Link](https://www.zumper.com/blog/rental-price-data-canada/)
    * Tuition is for a full-time Canadian graduate student in the 2021 - 2022 academic year [Link](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3710004501&cubeTimeFrame.startYear=2021+%2F+2022&cubeTimeFrame.endYear=2021+%2F+2022&referencePeriods=20210101%2C20210101)


#### Location of Canadian Universities

`universities_NSERC_locations.csv`
* location of all universities that received PhD and Postdoctoral funding in Canada; cities are all included in `rent_cities`

#### NSERC Awards and Inflation

`NSERC_funding_inflation_May20.csv`
* NSERC funding for CGS-M, PGS-D, CGS-D, and PDF from 2003 to present
* Inflation calculated using [Bank of Canada info](https://www.bankofcanada.ca/rates/related/inflation-calculator/)
* `single` and `four` represent the poverty line for a single person and a family of four, respectively, in a community of > 500k [Link](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=11100241010)

#### Cost of Living and PDF 

`pdf_costofliving.csv`
* Cost of living information for major cities in Canada which includes rent for a [2-bedroom apartment](https://www.zumper.com/blog/rental-price-data-canada/), utilities (phone, rent, electricity), transportation (car), grocery for a household of three, and preschool [source](https://wowa.ca/cost-of-living-canada)
* `Difference` calculated by subtraction cost of living expenses for a year from $45,000 (NSERC PDF)

-------------------

### Support or Contact

All of the data used is publicly available, and the repository is licensed under a [Creative Commons Zero license](https://choosealicense.com/licenses/cc0-1.0/) and free for reuse. 

Specific questions can be directed to [Courtney Robichaud](https://crobichaud.weebly.com/).
