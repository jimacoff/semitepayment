<?php echo $header?>
<!-- Page content -->
<div class="page-content">
    <!-- Page header -->
    <div class="page-header">
        <div class="page-title">
            <h3><?php echo $heading_title?> <small><?php echo $heading_sub_title?></small></h3>
        </div>
    </div>
    <!-- /page header -->
    <!-- Breadcrumb line -->
    <div class="breadcrumb-line">
        <ul class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
            <?php } ?>
        </ul>
    </div>
    <!-- /breadcrumb line -->
        <?php if ($error_warning) { ?>
    <div class="alert alert-danger fade in block-inner">
        <button type="button" class="close" data-dismiss="alert">×</button>
        <i class="icon-cancel-circle"></i> <?php echo $error_warning; ?>
    </div>
    <?php } ?>
            <?php if ($success) { ?>
    <div class="alert alert-success fade in block-inner">
        <button type="button" class="close" data-dismiss="alert">×</button>
        <i class="icon-cancel-circle"></i> <?php echo $success; ?>
    </div>
    <?php } ?>
    <div class="panel panel-default">
        <div class="panel-heading"><h6 class="panel-title"><i class="icon-users2"></i> <?php echo $heading_title?></h6></div>
        <ul class="panel-toolbar">
            <li><a href="<?php echo $insert; ?>" title=""><i class="icon-plus"></i> <?php echo $button_insert; ?></a></li>
            <li><a href="javascript:void(0)" onclick="$('form').submit();" title=""><i class="icon-close"></i> <?php echo $button_delete; ?></a></li>
        </ul>
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal" role="form">
            <div class="table-responsive">
                <table class="table table-bordered table-check">
                    <thead>
                        <tr>
                            <th width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></th>
                            <th class="left"><?php if ($sort == 'ip') { ?>
                              <a href="<?php echo $sort_ip; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_ip; ?></a>
                              <?php } else { ?>
                              <a href="<?php echo $sort_ip; ?>"><?php echo $column_ip; ?></a>
                              <?php } ?></th>
                            <th class="right"><?php echo $column_customer; ?></th>
                            <th class="right"><?php echo $column_action; ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if ($customer_ban_ips) { ?>
                        <?php foreach ($customer_ban_ips as $customer_ban_ip) { ?>
                        <tr>
                          <td style="text-align: center;"><?php if ($customer_ban_ip['selected']) { ?>
                            <input type="checkbox" name="selected[]" value="<?php echo $customer_ban_ip['customer_ban_ip_id']; ?>" checked="checked" />
                            <?php } else { ?>
                            <input type="checkbox" name="selected[]" value="<?php echo $customer_ban_ip['customer_ban_ip_id']; ?>" />
                            <?php } ?></td>
                          <td class="left"><?php echo $customer_ban_ip['ip']; ?></td>
                          <td class="right"><?php if ($customer_ban_ip['total']) { ?>
                            <a href="<?php echo $customer_ban_ip['customer']; ?>"><?php echo $customer_ban_ip['total']; ?></a>
                            <?php } else { ?>
                            <?php echo $customer_ban_ip['total']; ?>
                            <?php } ?></td>
                          <td class="right"><?php foreach ($customer_ban_ip['action'] as $action) { ?>
                            [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                            <?php } ?></td>
                        </tr>
                        <?php } ?>
                        <?php } else { ?>
                        <tr>
                          <td class="center" colspan="10"><?php echo $text_no_results; ?></td>
                        </tr>
                        <?php } ?>
                    </tbody>

                </table>

            </div>
        </form>
        <div class="table-footer">
            <?php echo $pagination; ?>
        </div>
    </div>
</div>
<?php echo $footer?>