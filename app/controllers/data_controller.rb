class DataController < ApplicationController
        # action to handle populating the database with cards
        def populate
            # for each card sent
                # check if card exists if not create it
        end
    # action to handle updating stockrecords
        def update
            # for each, find stockrecord, update with new info
        end
end
# the gpu data will be updated periodically by a python service,
# this controller is intended to handle said updating

# need to handle authing microservice