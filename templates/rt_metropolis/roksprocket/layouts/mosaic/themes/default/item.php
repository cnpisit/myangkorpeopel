<?php
/**
 * @version   $Id: item.php 6272 2013-01-02 20:26:36Z josh $
 * @author    RocketTheme http://www.rockettheme.com
 * @copyright Copyright (C) 2007 - 2013 RocketTheme, LLC
 * @license   http://www.gnu.org/licenses/gpl-2.0.html GNU/GPLv2 only
 */

/**
 * @var $item RokSprocket_Item
 */
?>
<li<?php echo strlen($item->custom_tags) ? ' class="'.$item->custom_tags.'"' : ''; ?> data-mosaic-item>
	<div class="sprocket-mosaic-item" data-mosaic-content>
		<?php echo $item->custom_ordering_items; ?>
		<div class="sprocket-padding">
			<div class="sprocket-mosaic-content">
				<?php if ($item->getPrimaryLink()) : ?>
				<a href="<?php echo $item->getPrimaryLink()->getUrl(); ?>">
				<?php endif; ?>
					<?php if ($item->getPrimaryImage()) :?>
					<div class="sprocket-mosaic-image-container">
						<?php if ($item->getText() || $item->getPrimaryLink()): ?>
						<div class="sprocket-mosaic-text-container">
							<?php if ($item->getTitle()): ?>
							<h2 class="sprocket-mosaic-title<?php if ($item->getPrimaryImage() == false) echo ' sprocket-noimage'; ?>">
									<span><?php echo $item->getTitle();?></span>
							</h2>
							<?php endif; ?>
						</div>
						<?php endif; ?>
						<img src="<?php echo $item->getPrimaryImage()->getSource(); ?>" alt="" class="sprocket-mosaic-image" />
					</div>
					<?php endif; ?>
				<?php if ($item->getPrimaryLink()) : ?>
				</a>
				<?php endif; ?>

				<?php if ($item->getText() || $item->getPrimaryLink() || $item->getAuthor() || $item->getDate() || $item->getPrimaryLink() || count($item->custom_tags_list)) : ?>
				<div class="sprocket-mosaic-wrap">
					<?php if ($parameters->get('mosaic_article_details')): ?>
					<div class="sprocket-mosaic-infos">
						<?php if ($parameters->get('mosaic_article_details') != 'date'): ?>
						By 	<span class="author"><?php echo $item->getAuthor(); ?></span>
						<?php endif; ?>
						<?php if ($parameters->get('mosaic_article_details') == 1): ?><span class="info-separator"> / </span><?php endif; ?>
						<?php if ($parameters->get('mosaic_article_details') != 'author'): ?>
						<span class="date"><?php echo $item->getDate();?></span>
						<?php endif; ?>
					</div>
					<?php endif; ?>
					<div class="sprocket-mosaic-text">
						<?php echo $item->getText(); ?>
					</div>
					<div class="clear"></div>
					<?php if ($item->getPrimaryLink()) : ?>
					<a href="<?php echo $item->getPrimaryLink()->getUrl(); ?>" class="sprocket-readmore readmore"><span><?php rc_e('READ_MORE'); ?></span></a>
					<?php endif; ?>
					<?php if (count($item->custom_tags_list)) : ?>
					<ul class="sprocket-mosaic-tags">
					<?php
						foreach($item->custom_tags_list as $key => $name){
					 		echo ' <li class="sprocket-tags-'.$key.'">'.$name.'</li>';
						}
					?>
					</ul>
					<?php endif; ?>
					<div class="clear"></div>
				</div>
				<?php endif; ?>
			</div>

			<?php if ($item->getPrimaryImage() == false): ?>
				<div class="sprocket-mosaic-text-container sprocket-noimage">
					<div class="sprocket-mosaic-text">
						<?php echo $item->getText(); ?>
					</div>

					<?php if ($item->getPrimaryLink()) : ?>
					<a href="<?php echo $item->getPrimaryLink()->getUrl(); ?>" class="sprocket-readmore"></a>
					<?php endif; ?>
					<div class="clear"></div>
				</div>
			<?php endif; ?>
		</div>
	</div>
</li>