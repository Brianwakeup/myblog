package com.my.blog.website.service;

import com.my.blog.website.modal.Vo.OptionVo;

import java.util.List;
import java.util.Map;

public interface IOptionService {

    void insertOption(OptionVo optionVo);

    void insertOption(String name, String value);

    List<OptionVo> getOptions();


    /**
     * 保存一组配置
     *
     * @param options
     */
    void saveOptions(Map<String, String> options);
}
