// Copyright 2016-2016 the openage authors. See copying.md for legal info.

#include "gui_standalone_subtexture.h"

namespace openage {
namespace gui {

GuiStandaloneSubtexture::GuiStandaloneSubtexture(GLuint id, const QSize &size) :
	id(id),
	size(size) {
}

GuiStandaloneSubtexture::~GuiStandaloneSubtexture() {
	glDeleteTextures(1, &this->id);
}

void GuiStandaloneSubtexture::bind() {
	glBindTexture(GL_TEXTURE_2D, this->textureId());
}

qint64 GuiStandaloneSubtexture::comparisonKey() const {
	// ASDF: Qt5 What does this do??????
	return 0;
}

bool GuiStandaloneSubtexture::hasAlphaChannel() const {
	// assume 32bit textures
	return true;
}

bool GuiStandaloneSubtexture::hasMipmaps() const {
	return false;
}

bool GuiStandaloneSubtexture::isAtlasTexture() const {
	return false;
}

int GuiStandaloneSubtexture::textureId() const {
	return this->id;
}

QSize GuiStandaloneSubtexture::textureSize() const {
	return this->size;
}

} // namespace gui
} // namespace openage
