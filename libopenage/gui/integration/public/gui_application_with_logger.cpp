// Copyright 2015-2019 the openage authors. See copying.md for legal info.

#include "gui_application_with_logger.h"

#include "../../guisys/private/gui_application_impl.h"
#include "../private/gui_log.h"

namespace openage::gui {

namespace {
std::shared_ptr<qtsdl::GuiApplicationImpl> create() {
	qInstallMessageHandler(gui_log);
	return qtsdl::GuiApplicationImpl::get();
}
} // namespace

GuiApplicationWithLogger::GuiApplicationWithLogger()
	:
	GuiApplication{create()} {
}

GuiApplicationWithLogger::~GuiApplicationWithLogger() = default;

} // namespace openage::gui
