// Copyright 2024-2024 the openage authors. See copying.md for legal info.

#pragma once

#include <cstddef>
#include <memory>
#include <utility>
#include <vector>

#include "pathfinding/types.h"


namespace openage::path {
class Sector;

/**
 * Grid for flow field pathfinding.
 */
class Grid {
public:
	/**
	 * Create a new empty grid of width x height sectors with a specified size.
	 *
	 * @param width Width of the grid.
	 * @param height Height of the grid.
	 * @param sector_size Side length of each sector.
	 */
	Grid(size_t width,
	     size_t height,
	     size_t sector_size);

	/**
	 * Create a grid of width x height sectors from a list of existing sectors.
	 *
	 * @param width Width of the grid.
	 * @param height Height of the grid.
	 * @param sectors Existing sectors.
	 */
	Grid(size_t width,
	     size_t height,
	     std::vector<std::shared_ptr<Sector>> &&sectors);

	/**
	 * Get the size of the grid.
	 *
	 * @return Size of the grid (width x height).
	 */
	std::pair<size_t, size_t> get_size() const;

	/**
	 * Get the sector at a specified position.
	 *
	 * @param x X coordinate.
	 * @param y Y coordinate.
	 *
	 * @return Sector at the specified position.
	 */
	const std::shared_ptr<Sector> &get_sector(size_t x, size_t y);

	/**
	 * Get the sector with a specified ID
	 *
	 * @param id ID of the sector.
	 *
	 * @return Sector with the specified ID.
	 */
	const std::shared_ptr<Sector> &get_sector(sector_id_t id) const;

private:
	/**
	 * Width of the grid.
	 */
	size_t width;

	/**
	 * Height of the grid.
	 */
	size_t height;

	/**
	 * Sectors of the grid.
	 */
	std::vector<std::shared_ptr<Sector>> sectors;
};


} // namespace openage::path
