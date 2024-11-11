#ifndef MAIN_H
#define MAIN_H

#define logSection(section) log_i("************* %s **************", section);
#define BUILD (String(__DATE__) + " - " + String(__TIME__)).c_str()

#endif