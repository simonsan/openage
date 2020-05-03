// Copyright 2014-2019 the openage authors. See copying.md for legal info.

#include <iomanip>
#include <iostream>
#include <thread>
#include <vector>

#include "log.h"
#include "logsink.h"
#include "logsource.h"

#include "../util/strings.h"

namespace openage::log::tests {


class TestLogSource : public LogSource {
public:
	std::string logsource_name() override {
		return "TestLogSource";
	}
};


class TestLogSink : public LogSink {
public:
	explicit TestLogSink(std::ostream &os)
		:
		os{os} {}
private:
	std::ostream &os;

	void output_log_message(const message &msg, LogSource * /*source*/) override {
		this->os << msg << std::endl;
	}
};


void demo() {
	TestLogSource logger;
	TestLogSink sink{std::cout};

	logger.log(MSG(err) << 1337 << "lol...");
	logger.log(MSG(crit) << util::sformat("wtf %s %d", "test", 1337));

	std::thread t0([&]() {
		logger.log(MSG(info) << "this msg comes from a thread");
	});

	std::thread t1([&]() {
		logger.log(MSG(dbg) << "this one, too!");
	});

	auto m = MSG(warn);
	for (int i = 0; i < 4; i++) {
		m << i << ", ";
	}

	logger.log(m);

	t0.join();
	t1.join();
}

} // namespace openage::log::tests
