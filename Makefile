# makefile for running tests
# can be called from jenkins
# todo: may need to set PATH appropriately

default: tests

export PATH
PATH:=$(PATH):

TOP_TARGETS :=shell-tests python-tests
BUILDROOT :=$(shell /bin/pwd -P)
ACT_BASE ?=$(BUILDROOT)/acts
ACT_DIRS :=$(shell ls -d $(ACT_BASE)/*)
TEST_REP_DIR :=$(BUILDROOT)/test-reports
BIN :=$(BUILDROOT)/bin
RESULTS_DIR :=$(BUILDROOT)/test-results
HDR:= =====

.PHONY: clean
.PHONY: tests ruby-tests shell-tests python-tests
.PHONY: unittests ruby-unittests shell-unittests shiot-tests python-unittests

tests: clean $(TEST_REP_DIR)
	@$(MAKE) selftest > $(TEST_REP_DIR)/selftest.out 2>&1
	@$(MAKE) -k $(TOP_TARGETS)

# make -k doesn't exit on first error
unittests:
	@$(MAKE) -k shell-unittests python-unittests

shell-tests:
	@$(MAKE) shiot-tests shunit2-tests

python-tests:
	@$(MAKE) -k python-unittests

ruby-tests:
	@$(MAKE) -k ruby-unittests

clean:
	/bin/rm -rf $(TEST_REP_DIR)

selftest: clean $(TEST_REP_DIR)
	@$(MAKE) ST_SUF=_st ACT_BASE=$(BUILDROOT)/testacts $(TOP_TARGETS)

$(RESULTS_DIR):
	mkdir -p $@

$(TEST_REP_DIR):
	mkdir -p $@

python-unittests: $(TEST_REP_DIR)
	@echo $(HDR) running $@
	cd $(ACT_BASE) \
	&& nosetests --with-xunit \
	--xunit-file=$(TEST_REP_DIR)/nosetests$(ST_SUF).xml
	@echo $(HDR)

ruby-unittests: $(TEST_REP_DIR)
	@echo $(HDR) running $@
	cd $(ACT_BASE) \
	&& $(BIN)/rspec-xunit -v -o $(TEST_REP_DIR)/rspec$(ST_SUF).xml
	@echo $(HDR)

shunit2-tests:
	@echo $(HDR) running $@
	cd $(ACT_BASE) \
	&& $(BIN)/shunit2-xunit -v -o $(TEST_REP_DIR)/shunit2$(ST_SUF).xml
	@echo $(HDR)

shiot-tests: $(TEST_REP_DIR)
	@echo $(HDR) running $@
	cd $(ACT_BASE) \
	&& $(BIN)/shiot-xunit -v -o $(TEST_REP_DIR)/shiot$(ST_SUF).xml
	@echo $(HDR)

