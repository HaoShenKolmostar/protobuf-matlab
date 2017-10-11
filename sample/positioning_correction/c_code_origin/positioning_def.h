/*
 * positioning_def.h
 *
 *  Created on: Apr 21, 2017
 *      Author: GanBo bo.gan@kolmostar.com
 *
 * @note
 * Copyright(C) Kolmostar Inc., 2017
 * All rights reserved.
 */

#ifndef INC_POSITIONING_DEF_H_
#define INC_POSITIONING_DEF_H_

#ifdef __LPC5411X__
#define POSITIONING_DOUBLE(x) x ## L
#else
#define POSITIONING_DOUBLE(x) x
#endif

#endif /* INC_POSITIONING_DEF_H_ */
