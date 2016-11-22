# Tack Rails Server Application
## Directory Structure Breakdown

###### Note: some un-touched (auto-generated) top-level directories have been ommitted for brevity.
##### Top Level
- **app/** --- Rails application files
- **config/** --- Rails and MongoDB configuration
- **db/** --- MongoDB seeds file
- **lib/** --- JSON Web Token (JWT) helper class
- **spec/** --- Tests

##### app/

- **assets/** - Static assets (unused by Tack's JSON API)
- **controllers/** - Application Controllers
- **models/** --- Application Models
- **views/** --- Application Templates (RABL templates for JSON API)

###### Most of the code in this repository does a relatively good job at self-documenting. Ruby produces extrodinarily readble code that's usually semantically representitive of its functionality. Additionally, most class definitions integral to the functionality of the application are well-commented.
